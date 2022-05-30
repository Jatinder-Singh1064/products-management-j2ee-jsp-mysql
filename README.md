# products-management-j2ee-jsp-mysql

You are working as a J2EE developer in ABC Company. ABC is an insurance company that provides the “protection plan” for digital devices including TV, Camera, Cellphone, etc. You are asked to design a web application using J2EE/JSP/MySQL for the Customer Service department which fulfills the following functionalities: 
1. When customers buy any product from the partner companies, they should register the product in the ABC company website in order to join to the “protection plan”. For doing this, the user should: 
  • Create an account in the site. User should enter username, password, the Cellphone no and email along with the name/address. The login information should be stored in the database table. 
  • To register a device/product, Users should enter login-id (username) along with “product name” and “serial no” and “purchase date” of the product. This data should be stored in the database table 
      o How to validate the ProductName? 
      o Remember that each user may register multiple products 
      
2. The customer can submit a claim for any registered digital device when the device needs a repair or replacement under the protection plan. 
  • According to the ABC protection plan policy, for any registered digital device, the customer can claim repair/replacement for a maximum of 3 times within the five years of the protection plan. 
  • To submit a claim, the customer should log in, select/find the registered device, and click on the “Add a claim” button, then enter the date_of_claim, detailed description of incident/issue, and wait for the approval. The claim data should be stored in a database table. 
  • The customer can check the status of his/her claim and check whether it is approved or rejected. 
      o When a customer login, he/she can see the registered devices, and under each device, the list of claims can be displayed. The customer can add a new registered device, or add a new claim. 
  • Use your creativity to design the UI appropriately.
  
3. The company asks you to add the following security feature to the program: 
  • If the user doesn’t have a valid user account, the user can’t register the product
  • Add proper form validation feature to the webform
  
4. The company asks you to provide the following functionalities for the Web site Administrator users. When the Admin user logged in into the web application, the admin user can perform the followings: 
  • Can see all user accounts or do SEARCH to find a specific user account 
  • Can see all registered products by the user or do SEARCH to find a specific product 
  • Admin users can enter/update a list of available products on the website. The product info is stored in the database table, this table may have some columns like product-name, model, …. This information will be used when user wants to register a product. When the user wants to register a product, the user should select the “product-name” which exists in the database. 
  • The Admin user can see the list of recent claims and update their status (approved/rejected). 
  • The Admin user can see the following reports: 
    o The list of all users, their registered products and their claims.
