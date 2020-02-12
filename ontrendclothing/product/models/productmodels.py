from django.db import models


class Product(models.Model):
    SKU              = models.AutoField(primary_key=True)
    title            = models.CharField(max_length=50)
    description      = models.TextField()
    price            = models.PositiveIntegerField(default = 0)
    featureImg       = models.ImageField(default="img.jpg", upload_to='images/')
    displayImg       = models.ImageField(default="img.jpg", upload_to='images/')
    displayImgFirst  = models.ImageField(default="img.jpg", upload_to='images/')
    displayImgSecond = models.ImageField(default="img.jpg", upload_to='images/')
    displayImgThird  = models.ImageField(default="img.jpg", upload_to='images/')
    xs               = models.PositiveIntegerField(default = 0)
    sm               = models.PositiveIntegerField(default = 0)
    md               = models.PositiveIntegerField(default = 0)
    lg               = models.PositiveIntegerField(default = 0)
    xl               = models.PositiveIntegerField(default = 0)
    xxl              = models.PositiveIntegerField(default = 0)
    xxxl             = models.PositiveIntegerField(default = 0)
    type             = models.ForeignKey('Type', on_delete=models.CASCADE, default = " ")
    vendor           = models.ForeignKey('Vendor', on_delete=models.CASCADE, default = " ")

    class Meta:
        db_table = "product"

    def __str__(self):
        return self.title

    def totalInventory(self):
        return self.xs+self.sm+self.md+self.lg+self.xl+self.xxl+self.xxxl

class Type(models.Model):
    type = models.CharField(max_length=50, primary_key=True, default=None)

    class Meta:
        db_table = "type"

    def __str__(self):
        return self.type

class Vendor(models.Model):
    vendor = models.CharField(max_length=50, primary_key=True, default=None)

    class Meta:
        db_table = "vendor"

    def __str__(self):
        return self.vendor

class User(models.Model):
    username   = models.CharField(max_length=30)
    first_name = models.CharField(max_length=30)
    last_name  = models.CharField(max_length=30)
    useremail  = models.EmailField()
    password   = models.CharField(max_length=50)
    isAdmin    = models.BooleanField(default=False)
    img        = models.ImageField(default="img.jpg", upload_to='images/')
    class Meta:
        db_table = "user"

        def __str__(self):
            return self.username

class Customer(models.Model):
    user       = models.CharField(max_length=30)
    first_name = models.CharField(max_length=30)
    last_name  = models.CharField(max_length=30)
    email      = models.EmailField()
    key        = models.CharField(max_length=50)
    img        = models.ImageField(default="img.jpg", upload_to='images/')
    class Meta:
        db_table = "customer"

        def __str__(self):
            return self.user


class Customize(models.Model):
    mainbanner          = models.ImageField(default="images/70550984_10157373051965535_3336865258831609856_n.jpg", upload_to='images/')
    menbanner           = models.ImageField(default="images/64514024_2171307086325281_2513036548014866432_n.jpg", upload_to='images/')
    womenbanner         = models.ImageField(default="images/66695107_2171307216325268_6767799174848053248_n.jpg", upload_to='images/')
    herotitle           = models.CharField(max_length=50, default="Stay home and")
    herosubtitle        = models.CharField(max_length=50, default="Shop online")
    herobtntitle        = models.CharField(max_length=50, default="All Products")
    ghostbtntitle       = models.CharField(max_length=50, default="Reviews")
    featureprodtitle    = models.CharField(max_length=50, default="Ontrend this summer")
    reviewsectiontitle  = models.CharField(max_length=50, default="Our customers get all Apparel from us.")
    class Meta:
        db_table = "customize"


        

class Review(models.Model):
    name = models.CharField(max_length=50)
    review = models.TextField()
    img = models.ImageField(default="hero.jpg", upload_to='images/')
    class Meta:
        db_table = "review"