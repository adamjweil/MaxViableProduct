User.delete_all
Deck.delete_all

User.create(email: "email@email.com", password: "password")
Deck.create(title: "Sample Deck", creator_id: 1)
Deck.create(title: "Sample Deck 2", creator_id: 2)
Deck.create(title: "Sample Deck 3", creator_id: 3)
Deck.create(title: "Sample Deck 4", creator_id: 4)

40.times do
  Flashcard.create(question: Faker::ChuckNorris.fact, answer: Faker::ChuckNorris.fact, deck_id: Deck.all.sample.id)
end
