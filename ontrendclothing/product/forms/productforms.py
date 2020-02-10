from django import forms
from product.models.productmodels import Product, Type, Vendor, User, Customer, Customize, Review

class ProductForm(forms.ModelForm):
    #productsize = forms.ModelChoiceField(queryset=Size.objects.all())
    class Meta:
        model = Product
        fields = ['title', 'description', 'price', 'featureImg', 'displayImg', 'displayImgFirst', 'displayImgSecond', 'displayImgThird', 'vendor', 'type', 'xs', 'sm', 'md', 'lg', 'xl', 'xxl', 'xxxl']

class TypeForm(forms.ModelForm):
    class Meta:
        model = Type
        fields = "__all__"


class VendorForm(forms.ModelForm):
    class Meta:
        model = Vendor
        fields = "__all__"

class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'useremail', 'password', 'img']


class CustomerForm(forms.ModelForm):
    key = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        model = Customer
        fields = ['user', 'first_name', 'last_name', 'email', 'key', 'img']



class CustomizeForm(forms.ModelForm):
    class Meta:
        model = Customize
        fields = ['mainbanner']


class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = "__all__"