# Let's make a cart!

Welcome to Wit Living pratical interview test! In this test you will be implementing a full cart funcionality. Don't worry, you will not charge users when they checkout their cart :D

## What is this?

As a user on your system you want to give him the possiblity of adding products to his cart. Because users are always unsure of theirs purchases you will have to permit to remove a product or update the product quantities.
After this awesome functionalities you will give to the user that checkout his cart a super-charged fantabolastic thanks!

## Info
Your system will have 2 types of data

**User**

| id | name |
| ------ | ------ |
| 1 | Joao |
| 2 | Diogo |

**Product**

| id | name | price |
| ------ | ------ | ------ |
| 1 | Learn RoR - Beginner | 24.99
| 2 | Mastering RoR - Level over 9000 | 9001.00

## User Story

**Diogo** is preparing a workshop and will be offering **10 books of Learn Ror - Beginner**, so Diogo will go to your awesome store and add this to his cart. To reward a special one that really was interested in RoR Diogo decided to offer him **one Mastering RoR - Level over 9000**, so he will add this to his cart. Because of uncertainty of the amount of attendees, Diogo leave his store as it is. After 1 day Diogo comes back and add more **2 books of Learn Ror - Beginner**.

**Joao** also went to your store and he's interested in **2 copies of Mastering RoR - Level over 9000**, so he added to his cart as well.

## More answers!
In your solution you will also need to provide a possibility to get answers of the following:

1. What is the total that Diogo will have to pay?
2. What products and respective quantities has Diogo in his cart?
3. How many products are overall in your Cart system?
4. What is the total amount of money that you have pending on your system?

#### special one
Imagine that Learn Ror - Beginner price changed after Diogo has left the store for the first time (remember, he already added copies of this book).
How would you handle this case (inform him the price has chancged) when Diogo came back next day to add 2 more copies?

### Assumption
A user cart expires in 2 days after his last update. Make the necessary implementation/test of this assumption!
