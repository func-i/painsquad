[User, Advice, Recommendation].each &:destroy_all

user = User.create username: 'test user', email: 'test@email.com', password: 'password'


advice = Advice.create title: "Default"

rec1 = advice.recommendations.create(
  title:    "Behaviour Rehersal",
  image:    "http://placeotter.com/80/80",
  duration: "5 min. to 10 min.",
  context:  "Before Procedures"
)

rec1.steps.create(
  content: "Rehearse what you are going to do to relax, stay calm and get through the procedure"
)
rec1.steps.create(
  content: "When you hit play, an audio recording will start and lead you through relaxation exercises",
  tip:     "Put all your focus into this exercise!"
)
rec1.steps.create(
  content: "Lie down, knees bent, place 1 hand on your chest and BREATE"
)


rec2 = advice.recommendations.create(
  title:    "Mental Games",
  image:    "http://placeotter.com/80/80",
  duration: "5 min. to 10 min.",
  context:  "During Procedures, Headaches, Abdomen Pain, Muscle Pain"
)

rec2.steps.create(
  content: "Rehearse what you are going to do to relax, stay calm and get through the procedure"
)
rec2.steps.create(
  content: "When you hit play, an audio recording will start and lead you through relaxation exercises",
  tip:     "Put all your focus into this exercise!"
)
rec2.steps.create(
  content: "Lie down, knees bent, place 1 hand on your chest and BREATE"
)


rec3 = advice.recommendations.create(
  title:    "Gentle Exercise",
  image:    "http://placeotter.com/80/80",
  duration: "10 min. to 40 min.",
  context:  "Muscle Pain, Headache, Abdominal Pain, Surgeries",
)

rec3.steps.create(
  content: "Rehearse what you are going to do to relax, stay calm and get through the procedure"
)
rec3.steps.create(
  content: "When you hit play, an audio recording will start and lead you through relaxation exercises",
  tip:     "Put all your focus into this exercise!"
)
rec3.steps.create(
  content: "Lie down, knees bent, place 1 hand on your chest and BREATE"
)

