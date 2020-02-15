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
    path('logout', productviews.logout),
    path('custLogout', productviews.custLogout),
    path('addproduct', productviews.addproduct),
    path('showproduct', productviews.showproduct),
    path('editproduct/<int:id>', productviews.editproduct),
    path('updateproduct/<int:id>', productviews.updateproduct),
    path('deleteproduct/<int:id>', productviews.deleteproduct),
    path('addtype', productviews.addtype),
    path('addvendor', productviews.addvendor),
    path('adduser', productviews.adduser),
    path('showuser', productviews.showuser),
    path('edituser/<int:id>', productviews.edituser),
    path('updateuser/<int:id>', productviews.updateuser),
    path('deleteuser/<int:id>', productviews.deleteuser),
    path('addcust', productviews.addcust),
    path('showcust', productviews.showcust),
    path('editcust/<int:id>', productviews.editcust),
    path('updatecust/<int:id>', productviews.updatecust),
    path('deletecust/<int:id>', productviews.deletecust),
    path('home', productviews.home),
    path('custhome', productviews.custhome),
    path('onlinestore', productviews.onlinestore),
    path('allproducts', productviews.allproducts),
    path('custallproducts', productviews.custallproducts),
    path('productdetails/<int:id>', productviews.productdetails),
    path('custproductdetails/<int:id>', productviews.custproductdetails),
    path('addreview', productviews.addreview),
    path('search', productviews.search),
    path('searchproduct', productviews.searchproduct),
    path('custsearchproduct', productviews.custsearchproduct),
    path('getsearchedproduct', productviews.getsearchedproduct),
    path('getcustsearchedproduct', productviews.getcustsearchedproduct),
    path('customize', productviews.customize),
    
]
