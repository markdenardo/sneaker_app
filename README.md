DEMO: https://sneaker-zone.herokuapp.com/

Notes:

User Stories:

Every page will have a home page which will return the user to the new user page.

The user home page is a social media page where anyone can see everyone's purchase history.

<!-- The user's show page will have every sneaker they purchased. -->

The new user page will (eventually) have a log in.

<!-- A user can view users, create a user, edit a user name, and delete a user. -->
<!-- A user can view sneakers, create a sneaker, edit a sneaker, and delete a sneaker. -->

<!-- A user can view all the sneakers that they have ordered,  -->
which then takes them to the show page for the sneaker.

<!-- There can be no duplication of user_names  -->
or sneaker style

<!-- To shop a user can create a new order in the shop. -->
<!-- This order will include the user and the sneaker style color and size. -->

1. create new project: rails new sneaker_app database=postgresql

2. create new database: rails db:create

3. create resources:
    rails g resources Sneaker style color size:integer --no-test-framework
    rails g resources User name --no-test-framework
    rails g resources Shop sneaker_id:integer user_id:integer

5. active record association within the individual rb files:

        class Shop < ApplicationRecord
          belongs_to :user
          belongs_to :sneaker
        end

        class Sneaker < ApplicationRecord
          has_many :shops
          has_many :users, through: :shops
        end

        class User < ApplicationRecord
          has_many :shops
          has_many :sneakers, through: :shops
        end

6. rails db:create

7. rails db:migrate

8. create seed data

    Sneaker.destroy_all
    User.destroy_all
    Shop.destroy_all

    50.times do
      User.create(name: Faker::Sports::Basketball.player)
    end

    s1 = Sneaker.create(style: "rumba", color: "white", size: 44)
    s2 = Sneaker.create(style: "rumba", color: "black", size: 44)
    s3 = Sneaker.create(style: "track", color: "white", size: 44)
    s4 = Sneaker.create(style: "track", color: "black", size: 44)
    s5 = Sneaker.create(style: "court", color: "red", size: 44)
    s6 = Sneaker.create(style: "court", color: "black", size: 44)
    s7 = Sneaker.create(style: "court", color: "white", size: 44)

9. rails db:seed

10. rails s to start server on http://localhost:3000

11. index test path: http://localhost:3000/users

12. index controller: app/controllers/users_controller.rb

    def index
      @users = User.all
    end

12. index within view: app/views/users/index.html.erb

    <h1>Welcome to Sneaker Zone</h1>
    <ul><h2>User List</h2></ul>
     <ul>
       <% @users.each do |user| %>
          <tr>
            <td><%= link_to user.name, user %></td>
          </tr>
          <br>
        <% end %>
    </ul>

13. show test path: http://localhost:3000/users/:id

14. show controller:

    def show
    @user = User.find(params[:id])
    end

15. show views:

    <h1><%=@user.name%>'s Page</h1>

16. create test path: http://localhost:3000/users/new

17. new controller:

    def new
      @user = User.new
    end

18.    add new button to the index.html.erb

    <h3>Create a new User<h3>

    <%= button_to "New User", new_user_path, method: :get%>


19. new.html.erb:

    <h1>Create a New User</h1>

    <%= form_for @user do |f| %>
      name: <%= f.text_field :name %><br/>
      <%= f.submit %>

    <% end %>

20. create controller:

    def create
      @user = User.new(params.require(:user).permit(:name))
      if @user.save
        redirect_to @user
      else
        render "new"
      end
    end

21. add edit button to the show.html.erb:

    <h1><%=@user.name%>'s Page</h1>
    <%= button_to "Edit User", edit_user_path, method: :get%>

22. add edit to controller:

  def edit
    @user = User.find(params[:id])
  end

23. add update to controller:

def update
      @user = User.find(params[:id])
      @user.update(params.require(:user).permit(:name))
      redirect_to user_path(@user)
    end

24. add delete button to the show.html.erb



25. add destroy to the controller

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
    end

26. Test Index path for the Sneakers: http://localhost:3000/sneakers/

27. index controller for sneakers

    def index
      @sneakers = Sneaker.all
    end

28. html.erb for Sneakers

    <%@sneakers.each do |sneaker|%>
      <%=link_to sneaker.style, sneaker%>
      <br>
    <%end%>

29. test show page: http://localhost:3000/sneakers/15

30. create show method in controller:

    def show
      @sneaker = Sneaker.find(params[:id])
    end

31. show.html.erb (adds an edit button as well)

    <h1>Sneaker ZOOOOOONNNNNNEE</h1>

      <%=@sneaker.style%>
      <%=@sneaker.color%>
      <%=@sneaker.size%>

      <%= button_to "edit", edit_sneaker_path, method: :get%>

32. test new page http://localhost:3000/sneakers/new

33. new method in the controller

    def new
      @sneaker = Sneaker.new
    end

34. add a new button in the index.html.erb

    <%= button_to "New Sneaker", new_sneaker_path, method: :get%>

35. create new.html.erb

<h1>New Sneaker</h1>

    <%= form_for :sneaker do |f| %>
      Style: <%= f.text_field :style %><br />
      Color : <%= f.text_field :color %><br />
      Size : <%= f.number_field :size %><br />
      <%= f.submit %>
    <% end %>

36. create method in controller

    def create
      @sneaker = Sneaker.create(params.require(:sneaker).permit(:style, :color, :size))

      if @sneaker.save
        redirect_to @sneaker
      else
        render "new"
      end
    end

37. test edit in the views http://localhost:3000/sneakers/25/edit?

38. edit in controller

    def edit
      @sneaker = Sneaker.find(params[:id])
    end

39. edit in html.erb

    <h1>👟👟👟👟👟👟👟👟Edit <%=@sneaker.style%>👟👟👟👟👟👟👟👟</h1>

      <%= form_for @sneaker do |f| %>
        <%= f.label :sneaker_id%>
        <%= f.collection_select :style, Sneaker.all, :style, :style %>
        <%= f.label :sneaker_id%>
        <%= f.collection_select :color, Sneaker.all, :color, :color %>
        <%= f.label :sneaker_id%>
        <%= f.collection_select :size, Sneaker.all, :size, :size %>
        <%= f.submit %>
      <%end%>

40. update in controller

    def update
      @sneaker = Sneaker.find(params[:id])
      @sneaker.update(params.require(:sneaker).permit(:style, :color, :size))
      redirect_to sneaker_path(@sneaker)
    end

41. ***OPTIMIZATION*** add links to index.html.erb of users_path and sneakers_path to each view
    <%= button_to "Delete Sneaker", sneaker_path, method: :delete%>
    <%= button_to "Home Sneaker", sneakers_path, method: :get%>
    <%= button_to "Home User", users_path, method: :get%>

42. test delete in the views

43. create delete in the controller

    def destroy
      @sneaker = Sneaker.find(params[:id])
      @sneaker.destroy
      redirect_to sneakers_path
    end

44. test show view for shops_path

45. create index in controller shop

    def index
      @shops = Shop.all
    end

46. create index.html.erb for shops_path

47. create new_order button in the index.html.erb

48. create new seeds for sneakers focused on yeezy sneakers https://en.wikipedia.org/wiki/Adidas_Yeezy#Footwear

    50.times do
      Sneaker.create(style:['Yeezy Boost 350','Yeezy 950','Yeezy 350 Cleat','Yeezy Boost 350 V2','Yeezy Powerphase','Yeezy Boost 700','Yeezy 500'].to_a.sample, color:['white','black','red','ochre','beige'].to_a.sample, size:[40...45].sample)
    end

49. repeat all steps 11.-25 with shop

50. add delete page to show.html.erb

51. validations for user:

    class User < ApplicationRecord
      has_many :shops
      has_many :sneakers, through: :shops

      validates :name, presence: true

    end

52. validations for sneaker

    class Sneaker < ApplicationRecord
      has_many :shops
      has_many :users, through: :shops

        # validates :style, presence: true
        # validates :color, presence: true
        # validates :size, presence: true

    end

53. validations for shops

    class Shop < ApplicationRecord
      belongs_to :user
      belongs_to :sneaker

      # validates :user_id, presence: true
      # validates :sneaker_id, presence: true

    end

54. create custom routes

Rails.application.routes.draw do
    resources :shops
    resources :users
    resources :sneakers

  # resources :shops, only: [:index, :new, :create, :show,]
  # resources :users, only: [:index, :show, :new,]
  # resources :sneakers, only: [:index, :show,]
end


55.
