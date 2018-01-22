# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SkinConcern.create([
    {name: 'Acne & Blemishes'},
    {name: 'Anti-Aging'},
    {name: 'Dark Spots'},
    {name: 'Dryness'},
    {name: 'Dullness'},
    {name: 'Pores'}
  ])

Category.create([
    {name: 'Cleanser'},
    {name: 'Toner'},
    {name: 'Makeup Remover'},
    {name: 'Mositurizer'},
    {name: 'Serum'},
    {name: 'Scrub/Exfoliant'},
    {name: 'Mask'}
  ])