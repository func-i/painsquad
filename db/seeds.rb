[User, Advice, Recommendation].each &:destroy_all

user = User.create username: 'test user', email: 'test@email.com', password: 'password'


advice = Advice.create title: "Default"

advice.recommendations.create(
  title:    "Behaviour Rehersal",
  image:    "http://placeotter.com/80/80",
  duration: "5 min. to 10 min.",
  context:  "Before Procedures"
)

advice.recommendations.create(
  title:    "Mental Games",
  image:    "http://placeotter.com/80/80",
  duration: "5 min. to 10 min.",
  context:  "During Procedures, Headaches, Abdomen Pain, Muscle Pain"
)

advice.recommendations.create(
  title:    "Gentle Exercise",
  image:    "http://placeotter.com/80/80",
  duration: "10 min. to 40 min.",
  context:  "Muscle Pain, Headache, Abdominal Pain, Surgeries",
)
