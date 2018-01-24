# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skinconcern.create([
    {name: 'Acne & Blemishes'},
    {name: 'Anti-Aging'},
    {name: 'Dark Spots'},
    {name: 'Dryness'},
    {name: 'Dullness'},
    {name: 'Pores'}
  ])

Category.create([
    {part: 'face', name: 'Cleanser'},
    {part: 'face', name: 'Toner'},
    {part: 'face', name: 'Makeup Remover'},
    {part: 'face', name: 'Mositurizer'},
    {part: 'face', name: 'Serum'},
    {part: 'face', name: 'Scrub/Exfoliant'},
    {part: 'face', name: 'Mask'},
    {part: 'hair', name: 'Shampoo'},
    {part: 'hair', name: 'Conditioner'},
    {part: 'hair', name: 'Styling'},
    {part: 'body', name: 'Body Wash'},
    {part: 'body', name: 'Scrub & Exfoliants'},
    {part: 'body', name: 'Body Mositurizer'},
    {part: 'body', name: 'Sunscreen & After Sun Care'},
    {part: 'body', name: 'Deodorant & Antiperspirant'},
    {part: 'body', name: 'Body Wash'}
  ])

