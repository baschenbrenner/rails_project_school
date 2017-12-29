Specifications for the Rails Assessment

Specs:

 Using Ruby on Rails for the project
 x Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    I have several has_many relationships, one is that a question has many comments
 x Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    i have several belongs_to relationships, one would be that a question belongs_to a course
 x Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    i have several has_many through relationships, one would be that a teacher has many students through a course
 The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    i have included an attribute writer for the adding courses when a teacher is creating students.
 Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    I have included validations for teachers, students, questions, and comments 
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    
 Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
 Include signup (how e.g. Devise)
 Include login (how e.g. Devise)
 Include logout (how e.g. Devise)
 Include third party signup/login (how e.g. Devise/OmniAuth)
 Include nested resource show or index (URL e.g. users/2/recipes)
 Include nested resource "new" form (URL e.g. recipes/1/ingredients)
 Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 x Views use partials if appropriate