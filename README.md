# COM206-Midterm
# Gülşah – Smart Clothing Store Application
## Project Overview
Gülşah is a smart clothing store application designed to improve the customer shopping experience by allowing users to browse products, select clothing details, and either reserve items at a branch or purchase them through delivery.
The application focuses on providing a smooth and modern digital shopping system for clothing stores.

## Research Problem
Customers often face difficulties when shopping for clothes, such as:
Not knowing product availability
Difficulty selecting the correct size
Wasting time visiting branches without reserving items
Limited flexibility between reservation and delivery options
This project aims to solve these issues through a structured and user-friendly mobile application.

## Motivation
The motivation behind this project is to digitalize clothing store services by:
Allowing secure user login
Showing newest products and offers
Giving customers flexible purchase or reservation options
Improving overall shopping efficiency

## System Features
1. Authentication System
User account creation
Login using numeric password
Optional biometric authentication (fingerprint)

2. Home Page
After login, the user sees:
Newest products
Special offers
Navigation options:
My Profile
Cart
Shop

3. My Profile Page
Contains:
Personal information
Purchase history
Expenses summary
Account details (email, phone number, etc.)

4. Shop Page
User can:
Select clothing item
View fabric details
Choose weight (used to determine size)
Select preferred color
After selection:
User proceeds to confirmation page

5. Reservation or Purchase Option
User chooses between:
Reserving the item at a selected branch
Purchasing with home delivery
If reservation is selected:
User chooses nearest branch
If delivery is selected:
System uses saved address
Both options lead to:

6. Payment Page
Final step where the user completes the payment process.
Control Flow
User creates account / logs in
User views homepage
User selects product
User chooses size (based on weight) and color
User confirms item
User chooses reservation or delivery
User selects branch or confirms address
User proceeds to payment
Implementation Strategy
The application will be developed using Flutter.
The project will follow a modular structure:
Authentication module
Product module
Cart module
Reservation & delivery module
Payment module
The design will separate UI components from business logic to ensure clean architecture and maintainability.
