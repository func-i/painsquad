class ReportService

  def initialize(user, report_type)
    @user = user
    @report_type = report_type

    # => Get all the user's submissions
    @submissions = Submission.where(user_id: @user.id).by_date.limit(100)
    @graph_data = {}
  end

  def report_data
    case @report_type
    when "action"
      action_data
    when "cause"
      cause_data
    when "effect"
      effect_data
    when "pain"
      pain_data
    end

    {report: @graph_data}
  end

  def action_data
    med_data()
    strat_data()    
  end

  def med_data
    graph_data = {}

    # => Loop through the submissions to add the to graphing data
    @submissions.each do |submission|

      submission.answers.includes(question: :choices).where(questions: {tag: 'medications'}).each do |answer|
        # next if answer.choice.textfield || answer.choice.can_disable
        next if answer.choice.try(:can_disable)
        graph_data[answer.choice.content] ||= {
          count: 0,
          total: 0
        }

        # => Increment the number of times this was answered
        graph_data[answer.choice.content][:count] += 1
        graph_data[answer.choice.content][:total] = graph_data[answer.choice.content][:total] + (answer.value || 0)
        graph_data[answer.choice.content][:average] = graph_data[answer.choice.content][:total] / graph_data[answer.choice.content][:count]
      end
    end

    @graph_data[:med] = graph_data
  end  

  def strat_data
    graph_data = {}

    # => Loop through the submissions to add the to graphing data
    @submissions.each do |submission|

      submission.answers.includes(question: :choices).where(questions: {name: 'other_strategies'}).each do |answer|
        # next if answer.choice.textfield || answer.choice.can_disable
        next if answer.choice.try(:can_disable)
        graph_data[answer.choice.content] ||= {
          count: 0,
          total: 0
        }

        # => Increment the number of times this was answered
        graph_data[answer.choice.content][:count] += 1
        graph_data[answer.choice.content][:total] = graph_data[answer.choice.content][:total] + (answer.value || 0)
        graph_data[answer.choice.content][:average] = graph_data[answer.choice.content][:total] / graph_data[answer.choice.content][:count]
      end
    end

    @graph_data[:strat] = graph_data
  end

  def cause_data
    @graph_data[:submission_count] = 0

    @submissions.full.each do |submission|

      submission.answers.includes(question: :choices).where(questions: {tag: 'pain_cause'}).each do |answer|
        next if answer.choice.try(:textfield) || answer.choice.try(:can_disable)          
        @graph_data[answer.choice.content] ||= 0
        @graph_data[answer.choice.content] += 1 
      end

      @graph_data[:submission_count] += 1
    end
  end

  def effect_data
    @submissions.full.each do |submission|

      submission.answers.includes(question: :choices).where(questions: {tag: 'effect'}).each do |answer|
        next if answer.choice.try(:textfield) || answer.choice.try(:can_disable)
        @graph_data[answer.question.report_label] ||= {
          count: 0,
          total: 0,
          average: 0
        }

         # => Increment the number of times this was answered
        @graph_data[answer.question.report_label][:count] += 1
        @graph_data[answer.question.report_label][:total] += answer.value
        @graph_data[answer.question.report_label][:average] = @graph_data[answer.question.report_label][:total] / @graph_data[answer.question.report_label][:count]
      end
    end
  end

  def pain_data
    @submissions.full.each do |submission|
      submission.answers.includes(question: :choices).where(questions: {tag: 'intensity'}).each do |answer|
        next if answer.choice.try(:textfield) || answer.choice.try(:can_disable)
        date = submission.created_at.strftime("%b %e, %Y")
        @graph_data[date] ||= {}

        lbl = answer.question.report_label.downcase.to_sym
        val = @graph_data[date][lbl]

        puts "#{date} => #{lbl} : #{val}"
        if val            
          case lbl
          when :least
            val = answer.value if answer.value < val                
          when :most
            val = answer.value if answer.value > val
          else
            val = answer.value
          end
        else
          val = answer.value
        end

        @graph_data[date][lbl] = val
        
      end
    end    
  end
end