# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skinconcern.create([
    {name: 'acne & blemishes'},
    {name: 'anti-aging'},
    {name: 'dark spots'},
    {name: 'dryness'},
    {name: 'dullness'},
    {name: 'pores'}
  ])

Category.create([
    {part: 'face', name: 'Cleanser'},
    {part: 'face', name: 'Toner'},
    {part: 'face', name: 'Makeup Remover'},
    {part: 'face', name: 'Face Mositurizer'},
    {part: 'face', name: 'Face Serum'},
    {part: 'face', name: 'Face Scrub/Exfoliant'},
    {part: 'face', name: 'Face Mask'},
    {part: 'hair', name: 'Shampoo'},
    {part: 'hair', name: 'Conditioner'},
    {part: 'hair', name: 'Styling'},
    {part: 'body', name: 'Body Wash'},
    {part: 'body', name: 'Body Scrubs & Exfoliants'},
    {part: 'body', name: 'Body Mositurizer'},
    {part: 'body', name: 'Sunscreen & After Sun Care'},
    {part: 'body', name: 'Deodorant & Antiperspirant'},
    {part: 'body', name: 'Body Wash'}
  ])

