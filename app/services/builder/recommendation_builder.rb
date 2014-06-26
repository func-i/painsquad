module Builder
  class RecommendationBuilder

    def self.generate
      numbing_cream
      pain_medication_regularly
      as_needed_medication
      behaviour_rehearsal
      distraction
      mental_games
      imagery
      mini_relaxation
      applying_cold
      applying_heat
      belly_breathing
      mental_relaxation
      muscle_relaxation
      gentle_exercise
      yoga
    end

    protected

    class << self

      ### PHARMACOLOGICAL
      def numbing_cream
        Recommendation.create(
          group:       'prevent',
          section:     'pharmacological',
          style:       'basic',
          title:       'Numbing Cream',
          image:       'http://placeotter.com/80/80',
          duration:    '45 min. to 60 min.',
          context:     'Before Procedures',
          description: "Remember to apply pain numbing cream (topical anesthetic) 45-60 minutes before the procedure if your healthcare team has said it's okay.",
          byline:      nil
        )
      end

      def pain_medication_regularly
        Recommendation.create(
          group:       'manage',
          section:     'pharmacological',
          style:       'basic',
          title:       'Take Your Pain Medication Regularly',
          image:       'http://placeotter.com/80/80',
          duration:    '1 min.',
          context:     'Surgery, Headaches, Abdomen Pain',
          description: 'Make sure you are sticking to the medication schedule your doctor recommends.',
          byline:      "If taking your medications is difficult, you can speak to your pharmacist about useful options such as setting reminders on a cell phone or using post-it notes. <br/>Make sure to talk to your doctor, nurse, or pharmacist if you’re having trouble taking your medications, if they are not working or if you’re having side effects from them."
        )
      end

      def as_needed_medication
        Recommendation.create(
          group:       'manage',
          section:     'pharmacological',
          style:       'basic',
          title:       'Take an "as needed" medication',
          image:       'http://placeotter.com/80/80',
          duration:    '1 min.',
          context:     'Surgery, Headaches, Abdomen Pain',
          description: 'If your doctor has given you a medication for break-through pain AND it is time to take it, consider taking it now.',
          byline:      "You can talk to your parents or healthcare team if you’re not sure about when and how to take these medications. <br/>Make sure to talk to your doctor, nurse, or pharmacist if you’re having trouble taking your medications, if they are not working or if you’re having side effects from them."
        )
      end

      ### PSYCHOLOGICAL
      def behaviour_rehearsal
        rec = Recommendation.create(
          group:       'prevent',
          section:     'psychological',
          style:       'slideshow',
          title:       'Behaviour Rehearsal',
          image:       'http://placeotter.com/80/80',
          duration:    '5 min. to 10 min.',
          context:     'Before Procedures',
          description: 'Behaviour rehearsal helps you to prepare for an event that you think will be stressful before it even happens, like a painful procedure.',
          byline:      "What you need to do is break the situation into parts that you can imagine."
        )
        rec.steps.create(content: "Rehearse what you are going to do to relax, stay calm, and get through the procedure.")
        rec.steps.create(content: "Relax your muscles, breathe deeply, stay calm and use positive thoughts like 'I can do this'.")
        rec.steps.create(content: "Imagine how you will relax during each part of the procedure.")
        rec.steps.create(content: "When you've made it through the procedure, make sure you have a plan to celebrate your success! You might not be able to cope exactly the way you wanted, but you still made it through!")
      end

      def distraction
        Recommendation.create(
          group:       'both',
          section:     'psychological',
          style:       'basic',
          title:       'Distraction',
          image:       'http://placeotter.com/80/80',
          duration:    '5 min. to 30 min.',
          context:     'During Procedures, Headaches, Abdomen Pain, Muscle Pain',
          description: 'By turning your attention to something else, you can block out unpleasant or stressful thoughts.',
          byline:      "Make sure to choose pleasant things to focus your attention on. You can do things like listen to music, play videogames or concentrate on your breathing."
        )
      end

      def mental_games
        rec = Recommendation.create(
          group:       'both',
          section:     'psychological',
          style:       'nested',
          title:       'Mental Games',
          image:       'http://placeotter.com/80/80',
          duration:    '5 min. to 10 min.',
          context:     'During Procedures, Headaches, Abdomen Pain, Muscle Pain',
          description: 'Relaxation is an effective way to help you cope with pain and stress',
          byline:      'Use relaxation when you are worried about a procedure and during the procedure'
        )
        nest1 = rec.nested_recommendations.create(title: 'Alphabet Games', style: 'nested')
        nest1.steps.create(content: 'Think of any category of interest, such as sports, cars, teams, animals or countries')
        nest1.steps.create(content: 'Try to name as many as you can that start with the letter A')
        nest1.steps.create(content: 'When you\'re done, move on to the letters B, C, and so on through Z')

        nest2 = rec.nested_recommendations.create(title: 'Song Lyrics', style: 'nested')
        nest2.steps.create(content: 'Try to remember all the words to your favourite song')

        nest3 = rec.nested_recommendations.create(title: 'Counting Tiles', style: 'nested')
        nest3.steps.create(content: 'Count the number of tiles on the floor or dots on an area of the ceiling')
      end

      def imagery
        rec = Recommendation.create(
          group:       'both',
          section:     'psychological',
          style:       'slideshow',
          title:       'Imagery',
          image:       'http://placeotter.com/80/80',
          duration:    '5 min. to 30 min.',
          context:     'During Procedures, Headaches, Abdomen Pain',
          description: 'Imagery is like daydreaming except you are doing it on purpose',
          byline:      nil
        )
        rec.steps.create(content: "Imagine being in a pleasant place, maybe on a beach or in a park with your family and friends. This is much more interesting to think about than pain!")
        rec.steps.create(content: "Involve as many of your 5 senses as you can. For example, if you are thinking about the beach, think about the sound of the water, all the sights on the beach, the smell of the ocean or lake, the feeling of the sand and the taste of the water.")
      end

      def mini_relaxation
        rec = Recommendation.create(
          group:       'manage',
          section:     'psychological',
          style:       'slideshow',
          title:       'Mini-relaxation',
          image:       'http://placeotter.com/80/80',
          duration:    '5 mins.',
          context:     'During Procedures, Headaches, Abdomen Pain, Muscle Pain',
          description: 'Mini-relaxation is a very quick and easy way to relax when you feel stressed or are feeling pain wherever you are.',
          byline:      nil
        )
        rec.steps.create(content: "Take a deep breath in through your nose. Feel your stomach rise as you take in the deep breath.")
        rec.steps.create(content: "Hold your breath for a few seconds while you count to 5.")
        rec.steps.create(content: "Roll your shoulders in a big circle and then let them drop loose. Think “r-e-l-a-x.”")
        rec.steps.create(content: "Breathe out through your mouth, slow and relaxed, as if you’re softly whistling. Repeat steps and feel more relaxed each time.")
      end

      ### PHYSICAL
      def applying_cold
        rec = Recommendation.create(
          # group:       'manage',
          section:     'physical',
          style:       'basic',
          title:       'Applying Cold',
          image:       'http://placeotter.com/80/80',
          duration:    '15 min. to 20 min.',
          context:     'Mouth Sores, Muscle Pain',
          description: 'Cold temperatures can help reduce pain.',
          byline:      'For instance, the cold sensation from popsicles and ice chips can be really helpful for mouth sores! Apply a cold pack or other cold things like ice to the area you are feeling pain.'
        )
      end

      def applying_heat
        rec = Recommendation.create(
          # group:       'manage',
          section:     'physical',
          style:       'basic',
          title:       'Applying Heat',
          image:       'http://placeotter.com/80/80',
          duration:    '15 min. to 20 min.',
          context:     'Abdomen Pain, Muscle Pain',
          description: 'Warm temperatures can help reduce pain.',
          byline:      'For instance, the warm temperature of a hot pack can reduce muscle aches! Apply a hot pack to the area you are feeling pain. Remember not to apply heat to wounds or stitches.'
        )
      end

      def belly_breathing
        rec = Recommendation.create(
          group:       'both',
          section:     'physical',
          style:       'slideshow',
          title:       'Belly Breathing',
          image:       'http://placeotter.com/80/80',
          duration:    '5 min. to 30 min.',
          context:     'During Procedures, Headaches, Abdomen Pain, Muscle Pain',
          description: 'Belly breathing is one of the best and easiest ways to relax. It can help you manage pain and also distract you from unpleasant situations.',
          byline:      nil
        )
        rec.steps.create(
          content:    "Lie down, knees bent, place 1 hand on your chest and 1 hand just above your belly button.",
          image_path: "http://placeotter.com/80/80"
        )
        rec.steps.create(
          content:    "Take a deep breath in through your nose, pushing your belly out. Feel your bottom hand, on your belly, move out. The top hand on your chest should stay still. Notice how long your inhaled breath is by counting. When your belly is all the way out, pause for a moment...",
          image_path: "http://placeotter.com/80/80"
        )
        rec.steps.create(
          content:    "…now breathe out slowly, through puckered lips, to the same count you used to breathe in. Let your belly come down until it is flat.",
          image_path: "http://placeotter.com/80/80"
        )
        rec.steps.create(
          content:    "Repeat slowly a few times.  Notice your body beginning to feel relaxed with each breath out. After you have practiced this exercise a few times, you can make the count longer to get an even deeper, more relaxing breath.",
          image_path: "http://placeotter.com/80/80"
        )
      end

      def mental_relaxation
        rec = Recommendation.create(
          group:       'prevent',
          section:     'physical',
          style:       'slideshow',
          title:       'Mental Relaxation',
          image:       'http://placeotter.com/80/80',
          duration:    '10 min.',
          context:     'Surgeries, Headaches, Abdomen Pain, Muscle Pain',
          description: 'Mental relaxation is an effective way to help you cope with pain and stress.',
          byline:      nil
        )
        rec.steps.create(content: "Find a comfortable, quiet place to sit.")
        rec.steps.create(
          content: "When you hit play, an audio recording will start. The audio recording will lead you through the relaxation exercise.",
          audio_path: "NEED THESE ASSETS YO"
        )
      end

      def muscle_relaxation
        rec = Recommendation.create(
          group:       'prevent',
          section:     'physical',
          style:       'slideshow',
          title:       'Muscle Relaxation',
          image:       'http://placeotter.com/80/80',
          duration:    '15 min.',
          context:     'Headaches, Abdomen Pain, Muscle Pain',
          description: 'Muscle relaxation is a way to relieve muscle tension and pain by tensing and then relaxing different groups of muscles in your body.',
          byline:      nil
        )
        rec.steps.create(content: "Find a comfortable, quiet place to sit.")
        rec.steps.create(
          content: "When you hit play, an audio recording will start. The audio recording will lead you through the relaxation exercise.",
          audio_path: "NEED THESE ASSETS YO"
        )
      end

      def gentle_exercise
        Recommendation.create(
          group:       'manage',
          section:     'physical',
          style:       'basic',
          title:       'Gentle Exercise',
          image:       'http://placeotter.com/80/80',
          duration:    '10 min. to 40 min.',
          context:     'Muscle Pain, Headache, Abdominal Pain, Surgeries',
          description: 'Try going for a walk or carefully walking up and down the stairs at home.',
          byline:      'Research shows that physical activity can help you manage symptoms like pain. It’s important to talk to your health care provider and maybe a physiotherapist before you start adding physical activity to your routine. Some types of exercise may be risky depending on the type of cancer you have. Remember, stop right away if you experience sudden intense pain.'
        )
      end

      def yoga
        rec = Recommendation.create(
          group:       'manage',
          section:     'physical',
          style:       'nested',
          title:       'Stretching (yoga)',
          image:       'http://placeotter.com/80/80',
          duration:    '10 min. to 40 min.',
          context:     'Muscle Pain, Headache, Abdominal Pain, Surgeries',
          description: 'Yoga aims to restore the balance between one’s body, mind, and spirit through a series of gentle exercises and breathing techniques.',
          byline:      'There are lots of poses you can do in yoga.'
        )
        mountain = rec.nested_recommendations.create(title: "Mountain (tadasana) pose", style: "nested")
        mountain.steps.create(content: "Stand with feet hip-width apart and your weight evenly balanced between them.")
        mountain.steps.create(content: "Pull up through the top of your forehead and try to make your spine feel longer.")
        mountain.steps.create(content: "Tilt your tailbone (bottom of your spine) under so it points towards the ground and relax your shoulders away from the ears.")
        mountain.steps.create(content: "Breathe in and out smoothly.")
        mountain.steps.create(content: "Mentally scan your body, releasing any tension. Relax your neck, face, jaw, and tongue.")
        mountain.steps.create(content: "Tell yourself a positive phrase like “I am strong and brave”.")

        archer = rec.nested_recommendations.create(title: "Archer pose", style: "nested")
        archer.steps.create(content: "While standing, step forward with your left leg so your legs are about 2.5 feet apart.")
        archer.steps.create(content: "Turn your right foot out at a 45-degree angle.")
        archer.steps.create(content: "Raise your left arm straight out in front, parallel to the ground, with your hand in a fist.")
        archer.steps.create(content: "Pull your right arm back as if it’s pulling back on a bowstring.")
        archer.steps.create(content: "Both wrists form a straight line with your shoulders. Bend your left knee and squeeze your thighs together.")
        archer.steps.create(content: "Look at your left fist and feel like a strong warrior.")

        tree = rec.nested_recommendations.create(title: "Tree pose", style: "nested")
        tree.steps.create(content: "Stand upright and shift your weight to 1 foot.")
        tree.steps.create(content: "When you feel stable, place your other foot either at your ankle or inner thigh. Focus on a spot in front of you to help you balance.")
        tree.steps.create(content: "Breathe deeply and raise your arms and put your hands together in front of your chest.")
        tree.steps.create(content: "Hold for a few minutes and then switch legs.")

        ego = rec.nested_recommendations.create(title: "Ego pose", style: "nested")
        ego.steps.create(content: "Sitting at the edge of the bed, raise your arms overhead in a V shape.")
        ego.steps.create(content: "Stretch your thumbs to the sky and curl your fingers onto the palms of your hand.")
        ego.steps.create(content: "Breathe in and out slowly. Hold for as long as you can, up to a minute.")

        life_nerve = rec.nested_recommendations.create(title: "Life nerve stretch", style: "nested")
        life_nerve.steps.create(content: "Sitting up, flex both feet back towards the head.")
        life_nerve.steps.create(content: "Keeping a straight back, reach as far down your legs as you can – it might be your shins or your toes, or somewhere in between.")
        life_nerve.steps.create(content: "Breathe long slow breaths. Continue for 1 minute.")
      end

    end
  end
end
