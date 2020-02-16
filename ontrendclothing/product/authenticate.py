from django.shortcuts import render, redirect
from product.models.productmodels import Product, Type, Vendor, User

class Authenticate:
    def valid_user(function):
        def wrap(request):
            try:
                User.objects.get(username = request.session['username'])
                User.objects.get(password = request.session['password'])
                return function(request)
            except:
                return redirect("/login")
        return wrap


    

    





