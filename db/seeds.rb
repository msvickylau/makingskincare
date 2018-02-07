# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
    {id: 1, email: "vivi@gmail.com", username: "vivi", provider: nil, uid: nil},
    {id: 2, email: "coconutlover@gmail.com", username: "coconutlover", provider: nil, uid: nil},
    {id: 3, email: "chocobear@gmail.com", username: "chocobear", provider: nil, uid: nil},
    {id: 4, email: "jessicavocada@gmail.com", username: "Jessicavocado", provider: nil, uid: nil}
    ])

Skinconcern.create([
    {id: 1, name: "acne & blemishes"},
    {id: 2, name: "anti-aging"},
    {id: 3, name: "dark spots"},
    {id: 4, name: "dryness"},
    {id: 5, name: "dullness"},
    {id: 6, name: "pore"}
    {id: 7, name: ""},
    {id: 8, name: "sunprotection"}
    {id: 9, name: "oily skin"},
    {id: 10, name: "redness"},
    {id: 11, name: "cellulite"}
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
    ])


Formula.create([
    {id: 1, user_id: 1, category_id: 2, title: "Rose Water Toner", 
        description: "Soothing toner, great for acne", 
        direction: "Remove petals from stems and run them under luke-warm water to remove any leftover residue. Add petals to a large pot and top with enough distilled water to just cover (no more or you'll dilute your rosewater). over medium-low heat bring the water to a simmer and cover. Add witch hazel. Pour into spray bottles. Spray on clean face, remove excess with acotton ball.", 
        created_at: "2018-02-01 07:40:15", 
        updated_at: "2018-02-01 07:40:15", 
        image_file_name: "rose_water.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 29440, 
        image_updated_at: "2018-02-01 07:40:14"
        },
    {id: 2, user_id: 1, category_id: 13, title: "Lotion Bars", 
        description: "Easy to make lotion bars", 
        direction: "Combine ingredients in a quart-size glass mason jar and place jar in a small saucepan of water until melted. This will save your bowl and you can just designate this jar for these type of projects and not even need to wash it out!  Turn the burner on and bring water to a boil. Stir ingredients constantly until they are melted and smooth.  Remove from heat, let cool a bit, and add any desired essential oils and/or vitamin E. Gently stir by hand until essential oils are incorporated.  Carefully pour into molds or whatever you will be allowing the lotion bars to harden in (ideas below). I used silicone baking cups for easy removal, though any mold would work.  Allow the lotion bars to cool completely before attempting to pop out of molds. These could be made in different shaped molds for different holiday gifts (hearts for Valentine’s Day, flowers for Mother’s Day, etc.) or made in a square baking pan and then cut into actual bars.", 
        created_at: "2018-02-01 07:43:29", 
        updated_at: "2018-02-01 07:43:29", 
        image_file_name: "Homemade-Lotion-Bars-Image1.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 101187, 
        image_updated_at: "2018-02-01 07:43:29"
        },
    {id: 3, user_id: 1, category_id: 14, title: "Sunscreen Lotion Bars", 
        description: "Homemade Sunscreen Bars", 
        direction: "Combine all ingredients (except zinc oxide and essential oils if using) in a double boiler, or a glass bowl over a smaller saucepan with 1 inch of water in it.  Turn the burner on and bring water to a boil. Stir ingredients constantly until they are melted and smooth:  Remove from heat and add the zinc oxide powder and essential oils.  Gently stir by hand until essential oils are incorporated. Carefully pour into molds or whatever you will be allowing the lotion bars to harden in. I used these silicon baking cups, though any mold would work. This recipe exactly filled 12 silicon baking cups when I made it. Allow the lotion bars to cool completely before attempting to pop out of molds. These could be made in different shaped molds for different holiday gifts (hearts for valentines, flowers for Mother’s day, etc.) or made in a square baking pan and then cut into actual bars. They can be stored at room temperature or in the fridge or freezer for longer term storage. Keep below 80 degrees or they will melt! Adjust coverage to your needs and be careful not to burn while determining how long you can spend in the sun with these.", 
        created_at: "2018-02-01 07:47:56", 
        updated_at: "2018-02-01 07:47:56", 
        image_file_name: "Homemade-Lotion-Bars-Image1.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 101187, 
        image_updated_at: "2018-02-01 07:47:56"
        },
    {id: 4, user_id: 1, category_id: 13, title: "Lotion with shea butter", 
        description: "organic lotion", 
        direction: "Combine shea butter and safflower oil in a glass bowl.  Start mixing the shea butter and safflower with a hand immersion mixer to make a shea butter lotion.  Continue mixing until smooth, should take no more than 2 minutes to turn onto a lotion.  Pour into a pretty cream or lotion container and slather the cream on your body!", 
        created_at: "2018-02-01 07:52:04", 
        updated_at: "2018-02-01 07:52:04", 
        image_file_name: "shea-butter-lotion-1-800.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 64255, 
        image_updated_at: "2018-02-01 07:52:03"
        },
    {id: 5, user_id: 2, category_id: 12, title: "Coconut Sugar Scrub", 
        description: "coconut vanilla sugar body scrub will leave your skin ready to flaunt", 
        direction: "In a bowl, combine all ingredients. Add more or less oil depending on how oily you like your scrub.  Scoop the mixture into a reusable container.  Slather across your skin in the shower and enjoy! Just be careful. The bottom of your shower will likely get slippery.", 
        created_at: "2018-02-01 08:10:44", 
        updated_at: "2018-02-01 08:10:44", 
        image_file_name: "images.jpeg", 
        image_content_type: "image/jpeg", 
        image_file_size: 5141, 
        image_updated_at: "2018-02-01 08:10:43"
        },
    {id: 6, user_id: 2, category_id: 9, title: "Coconut Hair Mask", 
        description: "Apple cider vinegar is good for strengthening hair, while coconut oil replenishes protein.", 
        direction: "Add coconut oil and apple cider vinegar in a bowl. Mix well.  Coat and apply evenly to damp or dry hair and leave on for 15-20 minutes before rinsing out.  shampoo and condition as normal.", 
        created_at: "2018-02-01 08:14:33", 
        updated_at: "2018-02-01 08:14:33", 
        image_file_name: "schema-photo-5-Coconut-Oil-Hair-Masks-for-Every-Hair-Problem3.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 50222, 
        image_updated_at: "2018-02-01 08:14:33"
        },
    {id: 7, user_id: 2, category_id: 1, title: "Oil cleanser", 
        description: "Oil cleanser for blackhead-prone skin", 
        direction: "Mix all oils together. Shake before each use and rub gently on the forehead, t-zone area, cheeks, and chin. Leave on for 1-2 minutes and then remove with a warm, wet washcloth, lastly a final rinse of warm water.", 
        created_at: "2018-02-01 08:19:15", 
        updated_at: "2018-02-01 08:19:15", 
        image_file_name: "Oil-Cleanser.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 118408, 
        image_updated_at: "2018-02-01 08:19:14"
        },
    {id: 8, user_id: 2, category_id: 3, title: "Makeup Remover for Oily Skin", 
        description: "DIY makeup remover. Works great on stubborn waterproof mascara!", 
        direction: "Use about a quarter-sized amount of oil and massage over your face for one to two minutes. (No need to pre-wash or wet your skin.) Soak a clean washcloth in very hot water and wring it out before placing it over your face. Allow it to sit and steam your face for about a minute.  Give your skin a wipe with the clean side of the cloth and allow the thin layer of oil left behind to remain and soak into your skin.", 
        created_at: "2018-02-01 08:23:29", 
        updated_at: "2018-02-01 08:23:29", 
        image_file_name: "Oil-Cleanser.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 118408, 
        image_updated_at: "2018-02-01 08:23:28"
        },
    {id: 9, user_id: 3, category_id: 7, title: "Exquisite Chocolate Face Mask Recipe", 
        description: "This edible chocolate face mask features raw cacao powder and other ingredients right from the kitchen that make skin healthier, the tasty way.", 
        direction: "Mash the banana with a fork, then add the rest of the ingredients.  Generously apply the chocolate mixture to the face and neck.  After 10-20 minutes, wash the face mask off.", 
        created_at: "2018-02-01 08:27:53", 
        updated_at: "2018-02-01 08:27:53", 
        image_file_name: "Screen_Shot_2018-02-01_at_3.26.31_AM.png", 
        image_content_type: "image/png", 
        image_file_size: 301870, 
        image_updated_at: "2018-02-01 08:27:53"
        },
    {id: 10, user_id: 3, category_id: 4, title: "Light weight face mositurizer", 
        description: "Clean healthy facial moisturizer. This cream has only a few ingredients, no dyes, no chemical preservatives, no scents. Its non greasy and leaves my face feeling well moisturized. I also use it as a primer for my makeup in the morning, and I put a little on a cotton ball to clean off stubborn eye makeup", 
        direction: "Start by melting the beeswax and coconut oil in the almond oil.   Pour the melted oils into your blender and WALK AWAY. It is super-duper essential that that stuff get COOL before you start to blend. There is no getting around this. For me it took about 1 hr 15.    Mix the essential oil into your cup of Aloe Vera Gel.   Fire up the blender. Slowly pour the aloe vera gel into the blender as it whips. It’ll transform from a thick oil to a light and fluffy white lotion texture. The first time I did this I had to call my husband into the room to look- its for real lotion!   That’s it! You’ve made your own DIY facial moisturizer! Store some in a small container for your vanity, and put extra in the fridge. Keep in mind that lotion has a shelf life. Don’t use anything that looks/smells/feels wrong.", 
        created_at: "2018-02-01 08:34:00", 
        updated_at: "2018-02-01 08:34:00", 
        image_file_name: "coconut-oil-works.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 76031, 
        image_updated_at: "2018-02-01 08:34:00"
        },
    {id: 11, user_id: 4, category_id: 7, title: "Avocado and Honey face mask", 
        description: "Hydrating avocado mask to help  soften dry flakey skin patches.", 
        direction: " Remove seeds and peel the skin from the avocado and mash it up. Mix and stir thoroughly with 1 tablespoon of honey until a standard paste is produced.  A short application time of 15 minutes helps to erase any signs of dull complexion and gives the skin a radiant glow.", 
        created_at: "2018-02-01 18:45:42", 
        updated_at: "2018-02-01 18:45:42", 
        image_file_name: "avocado-honey.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 71827, 
        image_updated_at: "2018-02-01 18:45:42"
        },
    {id: 12, user_id: 4, category_id: 7, title: "Avocado and Yogurt Face Mask", 
        description: "Great facial mask to restore essential facial moisture. In addition, the lactic acid in yogurt help to kills bacteria and treat acne. ", 
        direction: "Take 1/4 avocado and squash it until the lumps disappear. Mix it with 1 teaspoon of organic yogurt and stir again until both are evenly combined. Apply for 10-15 mins, wash off with lukewarm water.", 
        created_at: "2018-02-01 18:48:46", 
        updated_at: "2018-02-01 18:48:46", 
        image_file_name: "avocado-yogurt-768x512.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 55232, 
        image_updated_at: "2018-02-01 18:48:46"
        },
    {id: 13, user_id: 4, category_id: 12, title: "Coffee Body Scrub", 
        description: "This coffee body scrub recipe will leave yours skin smooth and well hydrated. Coffee basically “buffs” your skin and gives it a nice golden glow.  Plus it can reduce the appearance of cellulite!", 
        direction: "(1) In a fast blender mix sugar and coconut oil until they are just blended. You don’t want to mix too long as this will break down the sugar and melt the coconut oil.  (2) Pour the sugar and coconut oil in an aluminum bowl placed in another bowl filled with cold iced water.   (3) Start whipping the scrub with an electric mixer until the scrub is fluffy and creamy. Add the ground coffee and liquid soap until they are just combined.   (4) Put the scrub in a pretty container and use within 1 month.   (5) If it’s hot (more than 25C) in your apartment, keep it in the fridge. Otherwise, you can leave it at room temperature.   (6)Use weekly in the morning shower as the body scrub, gently scrub your body but avoid sensitive areas.", 
        created_at: "2018-02-01 19:52:26", 
        updated_at: "2018-02-01 19:52:26", 
        image_file_name: "coffee-body-scrub-500.jpg", 
        image_content_type: "image/jpeg", 
        image_file_size: 40925, 
        image_updated_at: "2018-02-01 19:52:26"
        },
    ])