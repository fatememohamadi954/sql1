
from django.db import models

class User(models.Model):
    username = models.CharField(max_length=255, primary_key=True)
    full_name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    phone_number = models.IntegerField()

    def str(self):
        return self.username


class Admin(models.Model):
    username = models.CharField(max_length=255, primary_key=True)
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)

    def str(self):
        return self.username


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    sugar = models.IntegerField()
    coffee = models.IntegerField()
    flour = models.IntegerField()
    chocolate = models.IntegerField()
    vanilla = models.BinaryField()
    price = models.IntegerField()

    def str(self):
        return self.name


class Order(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='orders')
    purchase_amount = models.IntegerField()
    type = models.BinaryField()

    def str(self):
        return f"Order {self.id} by {self.user.username}"


class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('order', 'product')

    def str(self):
        return f"Order {self.order.id} Product {self.product.name}"


class Storage(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    amount = models.IntegerField()

    def str(self):
        return self.name


class UserOrder(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('user', 'order')

    def str(self):
        return f"User {self.user.username} Order {self.order.id}"
