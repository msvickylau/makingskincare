# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      /skinconcerns/1 have "next" and "previous" buttons that navigate to the following skinconcern show page by alphebetical order of skinconcern name
      /categories/1 have "next" and "previous" buttons that navigate to the following category show page by numerical order of category name

- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      /formulas index page has 'see description' link, on click will append formulas description.

- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      Category has_many Formulas - renders next and previous category on button click
      Formula has_many Comments - renders new comment in div after submiting a form 
      User has_many Formulas - renders users formulas on "view formulas" button click
      Skinconcerns has_many (and belongs to many) Formulas - renders next and previous skin concern on button click
      Formula has_many Ingredients - renders new form feild for ingredient on click of 'Add Ingredient' button

- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
      Comment form creates a resource and renders the response to the DOM without a page refresh.

- [x] Translate JSON responses into js model objects.
      Upon submission of a comment; the id, user, and content of new comment was used to create a JS comment object.
      Formula's date on users show page is taken from JSON response and turned into a JS date object

- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      Comment.prototype.renderComments -- The data of a comment is passed into the renderComments function and appended to the DOM.

Confirm:
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message




# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
      Category has_many :formulas, Category model line 2; 
      Formula has_many :ingredients, Formula model line 4;  
      User has_many :formulas, User model line 2

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      Formulas belongs_to :user and :category, Formula model line 3-4; 
      Ingredient belongs_to :formula, Ingredient model line 2; 

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      Formula has_many :skinconcerns, :through => :formula_skinconcerns, Formula model line 8

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      skinconcern_attributes, formula.skinconcerns

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      Formula
        validates :title, :description, :category, :ingredients, :direction, presence: true
        validates_attachment_content_type :image
      Skinconcern
        validates :name, uniqueness: { case_sensitive: false }
      User
        validates :username, presence: :true, uniqueness: { case_sensitive: false }       
        validate :validate_username

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      Formula.last_five_formulas, used on home page URL: /

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
      /formulas/new, Skin Concern

- [x] Include signup (how e.g. Devise)
      Uses Devise gem

- [x] Include login (how e.g. Devise)
      Uses Devise gem

- [x] Include logout (how e.g. Devise)
      Uses Devise gem

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      Uses OmniAuth-Facebook

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      /users/9/formulas/20

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      /users/9/formulas/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      /formulas/new  and  /users/sign_up

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate