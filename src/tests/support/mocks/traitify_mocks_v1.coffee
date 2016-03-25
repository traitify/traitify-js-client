MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/decks", 
  params: {},
  response: [{
    name: "Career Deck"
  }]
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/slides?locale_key=us-english",
  params: {},
  response: apiFactory.build("slides", {number: 84})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/slides?locale_key=us-english",
  params: {},
  response: apiFactory.build("slides", {number: 84, played: true})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/personality_types?image_pack=linear&locale_key=us-english",
  params: {},
  response: apiFactory.build("personality", {number: 6})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/personality_types?image_pack=linear&locale_key=us-english",
  params: {},
  response: apiFactory.build("personality", {number: 6})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played_with_blend/personality_types?image_pack=linear&locale_key=us-english",
  params: {},
  response: apiFactory.build("personalityWithBlend", {number: 6})
})

MockRequest.addMock({
  method: "PUT",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/slides/0"
  params: {"response":true,"time_taken":1000},
  response: ""
})
MockRequest.addMock({
  method: "PUT",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/slides"
  params: {"response":true,"time_taken":1000},
  response: ""
})

MockRequest.addMock({
  method: "PUT",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/slides",
  params: [{"id":0,"response":true,"response_time":1000}],
  response: ""
})
MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played_with_blend/personality_traits/raw?locale_key=us-english",
  params: "",
  response: apiFactory.build("personalityTraits", {number: 10})
})
MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/personality_traits/raw?locale_key=us-english",
  params: "",
  response: apiFactory.build("personalityTraits", {number: 10})
})
MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/personality_traits/raw?locale_key=us-english",
  params: "",
  response: apiFactory.build("personalityTraits", {number: 10})
})
MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/personality_types/{personality_type_id}/personality_traits?locale_key=us-english",
  params: "",
  response: apiFactory.build("personalityTraits", {number: 10})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/unplayed/slides/0?locale_key=us-english",
  params: {"response":true, "time_taken":1000},
  response: ""
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played_with_blend/slides?locale_key=us-english",
  params: {},
  response: apiFactory.build("slides", {number: 84, played: true})
})

MockRequest.addMock({
  method: "GET",
  url: "https://api-sandbox.traitify.com/v1/assessments/played/matches/careers?number_of_matches=8&locale_key=us-english",
  params: "",
  response: apiFactory.build("careers", {number: 8})
})
