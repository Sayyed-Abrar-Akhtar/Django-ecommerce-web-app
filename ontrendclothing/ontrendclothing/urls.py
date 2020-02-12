"""ontrendclothing URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from product.views import productviews

urlpatterns = [

    path('', productviews.login),
    path('login', productviews.login),
    path('custLogin', productviews.custLogin),
    path('addproduct', productviews.addproduct),
    path('addtype', productviews.addtype),
    path('addvendor', productviews.addvendor),
    path('adduser', productviews.adduser),
    path('addcust', productviews.addcust),
    path('showproduct', productviews.showproduct),
    path('showuser', productviews.showuser),
    path('showcust', productviews.showcust),
    path('editproduct/<int:id>', productviews.editproduct),
    path('edituser/<int:id>', productviews.edituser),
    path('editcust/<int:id>', productviews.editcust),
    path('updateproduct/<int:id>', productviews.updateproduct),
    path('updateuser/<int:id>', productviews.updateuser),
    path('updatecust/<int:id>', productviews.updatecust),
    path('deleteproduct/<int:id>', productviews.deleteproduct),
    path('deleteuser/<int:id>', productviews.deleteuser),
    path('deletecust/<int:id>', productviews.deletecust),
    path('home', productviews.home),
    path('custhome', productviews.custhome),
    path('onlinestore', productviews.onlinestore),
    path('allproducts', productviews.allproducts),
    path('search', productviews.search),
    path('logout', productviews.logout),
    path('custLogout', productviews.custLogout),
    path('addreview', productviews.addreview),
    path('customize', productviews.customize),
    path('productdetails/<int:id>', productviews.productdetails),
    path('searchproduct', productviews.searchproduct),
    path('getsearchedproduct', productviews.getsearchedproduct),
    
    
]
