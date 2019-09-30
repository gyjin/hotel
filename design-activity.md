What classes does each implementation include? Are the lists the same?

Implementation A: CartEntry, ShoppingCart, Order
Implementation B: CartEntry, ShoppingCart, Order
The lists are the same.

Write down a sentence to describe each class.

CartEntry is one instance that holds a unit price and quantity.
ShoppingCart is one instance that holds an array of entries.
Order is one instance that holds a new instance of ShoppingCart.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

When a new Order is created, a new instance of ShoppingCart is created as well. Order holds the ShoppingCart. Inside the ShoppingCart is an array of CartEntry instances, which hold specific item information. 

What data does each class store? How (if at all) does this differ between the two implementations?

CartEntry holds the data for a single item and its unit price and quantity. ShoppingCart holds an array of CartEntry instances. An Order creates a new ShoppingCart. This is the same between the two implementations. 

What methods does each class have? How (if at all) does this differ between the two implementations?

In Implementation A, the only class method is part of the Order class, where total price is calculated.
In Implementation B, the CartEntry class has a method that calculates the price for each item. The ShoppingCart class has a method to calculate the sum of all CartEntrys. The Order class has a method to calculate the total price including sales tax. 
These two implementations have completely different methods. 

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

A: Retained in Order
B: Delegated to other classes

Does total_price directly manipulate the instance variables of other classes?

A&B: Does not manipulate instance variables of other classes

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

Implementation B is much easier to modify. Only the price method in the CartEntry class would need to be modified, instead of the entire Order#total_price method in Implementation A. 

Which implementation better adheres to the single responsibility principle?

Implementation B. 

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

Implementation B.