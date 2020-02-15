from django.shortcuts import render, redirect
from product.models.productmodels import Product, Type, Vendor, User, Customer, Customize, Review
from product.forms.productforms import ProductForm, TypeForm, VendorForm, UserForm, CustomerForm, CustomizeForm, ReviewForm
from django.http import HttpResponse,JsonResponse
from product.authenticate import Authenticate
from django.db.models import Q 
from django.core.paginator import Paginator


'''
-------------------------------------------------------------
-----------User Login/logout---------------------------------
-------------------------------------------------------------
'''

def login(request):
    if request.method == "POST":
        request.session['username'] = request.POST['username']
        request.session['password'] = request.POST['password']
        try:
            user = User.objects.get(Q(username = request.POST.get('username')) & Q(password = request.POST.get('password'))) 
            if(user):
                request.session['id']= user.id
                request.session['isAdmin']= user.isAdmin
        except:
            pass
        return redirect('/showproduct')
    return render(request, 'login.html')


def logout(request):
    del request.session['username']
    del request.session['password']
    return redirect('/login')


'''
-------------------------------------------------------------
-----------Customer Login/Logout-----------------------------
-------------------------------------------------------------
'''


def custLogin(request):
    if request.method == "POST":
        request.session['user'] = request.POST['user']
        request.session['key'] = request.POST['key']
        try:
            cust = Customer.objects.get(Q(user = request.POST.get('user')) & Q(key = request.POST.get('key'))) 
            if(cust):
                request.session['custid']= cust.id
        except:
            pass
        return redirect('/custhome')
    return render(request, 'custlogin.html')


def custLogout(request):
    del request.session['user']
    del request.session['key']
    return redirect('/home')


'''
-------------------------------------------------------------
-----------Product add/update/delete----------------
-------------------------------------------------------------
'''

@Authenticate.valid_user
def addproduct(request):
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        typeform = TypeForm()
        print("entered post")
        if form.is_valid():
            print("is valid")
            form.save()
            return redirect('/showproduct')
    else:
        form = ProductForm()
        typeform = TypeForm()
        user = User.objects.get(id = request.session['id'])
    return render(request, 'newproduct.html', {'form':form, 'typeform': typeform, 'user':user})


def editproduct(request, id):
    if (request.session['username'] != "" ):
        vendors = Vendor.objects.all()
        types = Type.objects.all()
        products = Product.objects.get(SKU=id)
        return render(request, 'productedit.html', {'products':products, 'types':types, 'vendors':vendors})
    else:
        return redirect('/login')


def updateproduct(request, id):
    if (request.session['username'] != "" ):
        product = Product.objects.get(SKU=id)
        if request.method == "POST":
            form = ProductForm(request.POST, request.FILES, instance=product)
            if form.is_valid:
                form.save()
            return redirect('/showproduct')
        else:
            form = ProductForm()
        return render(request, 'productedit.html', {'form': form})
    else:
        return redirect('/login')


def deleteproduct(request, id):
    product = Product.objects.get(SKU = id)
    print("hi deleting")
    print(request.session['isAdmin'])
    if request.session['isAdmin'] == True:
        print("entered if in delete")
        product.delete()
    else:
        return redirect('/showproduct')
    return redirect('/showproduct')


@Authenticate.valid_user
def showproduct(request):
    limit = 5
    products = Product.objects.all().order_by('title')
    vendors = Vendor.objects.all()
    user = User.objects.get(id = request.session['id'])
    paginator = Paginator(products, limit)
    page =request.GET.get('page')
    products = paginator.get_page(page)
    
    return render(request, 'dashboard.html', {'products':products, 'vendors': vendors, 'user':user})


'''
-------------------------------------------------------------
-----------Product Type--------------------------------------
-------------------------------------------------------------
'''

@Authenticate.valid_user
def addtype(request):
    types = Type.objects.all()
    if request.method == 'POST':
        form = TypeForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/addproduct')
            except:
                pass
    else:
        form = TypeForm()
    return render(request, 'newtype.html', {'form':form, 'types': types})



@Authenticate.valid_user
def showTypes(request):
    types = Type.objects.all()
    return render(request, 'dashboard.html', {'types':types})


'''
-------------------------------------------------------------
-----------Product Vendor------------------------------------
-------------------------------------------------------------
'''

@Authenticate.valid_user
def addvendor(request):
    if request.method == 'POST':
        form = VendorForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/addproduct')
            except:
                pass
    else:
        form = VendorForm()
    return render(request, 'newvendor.html', {'form':form})



@Authenticate.valid_user
def showVendor(request):
    vendors = Vendor.objects.all()
    return render(request, 'newvendor.html', {'vendors':vendors})


'''
-------------------------------------------------------------
-----------User add/update/delete/show-----------------------
-------------------------------------------------------------
'''

def adduser(request):
    if request.method == 'POST':
        form = UserForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('/login')
            except:
                pass
    else:
        form = UserForm()
    return render(request, 'register.html', {'form':form})


def edituser(request, id):
    user = User.objects.get(id = id)
    adminuser = User.objects.get(id=request.session['id'])
    return render(request, 'updateuser.html', {'user':user, 'adminuser':adminuser})



def updateuser(request, id):
    user = User.objects.get(id=id)

    print(adminuser.isAdmin)
    if request.method == "POST":
        form = UserForm(request.POST, request.FILES, instance = user)
        if form.is_valid:
            form.save()
        return redirect('/showproduct')
    else:
        form = UserForm()       
    return render(request, 'updateuser.html', {'user':user})


def deleteuser(request, id):
    user = User.objects.get(id = id)
    print("hi deleting")
    print(request.session['isAdmin'])
    if request.session['isAdmin'] == True or request.session['id']==user.id:
        print("entered if in delete")
        user.delete()
    else:
        return redirect('/showproduct')
    return redirect('/showuser')


@Authenticate.valid_user
def showuser(request):
    limit = 1;
    users = User.objects.all()
    user = User.objects.get(id = request.session['id'])
    paginator = Paginator(users, limit)
    page =request.GET.get('page')
    users = paginator.get_page(page)
    return render(request, 'dashboarduser.html', {'users':users, 'user':user})



'''
-------------------------------------------------------------
-----------Customer add/update/delete/show-----------------------
-------------------------------------------------------------
'''

def addcust(request):
    if request.method == 'POST':
        custform = CustomerForm(request.POST, request.FILES)
        if custform.is_valid():
            try:
                custform.save()
                return redirect('/custLogin')
            except:
                pass
    else:
        custform = CustomerForm()
    return render(request, 'custadd.html', {'custform':custform})
    

def editcust(request, id):
    cust = Customer.objects.get(id = id)
    return render(request, 'custupdate.html', {'cust':cust})


def updatecust(request, id):
    cust = Customer.objects.get(id=id)
    if request.method == "POST":
        form = CustomerForm(request.POST, request.FILES, instance = cust)
        if form.is_valid:
            form.save()
        return redirect('/custhome')
    else:
        form = CustomerForm()       
    return render(request, 'custupdate.html', {'cust':cust})


def deletecust(request, id):
    cust = Customer.objects.get(id = id)
    print("hi deleting")
    if request.session['custid'] == cust.id:
        print("entered if in delete")
        cust.delete()
    else:
        return redirect('/custhome')
    return redirect('/home')


@Authenticate.valid_user
def showcust(request):
    limit = 1;
    custs = Customer.objects.all()
    user = User.objects.get(id = request.session['id'])
    paginator = Paginator(custs, limit)
    page =request.GET.get('page')
    custs = paginator.get_page(page)
    return render(request, 'dashboardcust.html', {'custs':custs, 'user':user})


'''
-------------------------------------------------------------
-----------Customer Reviews about product--------------------
-------------------------------------------------------------
'''

def addreview(request):
    if request.method == 'POST':
        revform = ReviewForm(request.POST, request.FILES)
        if revform.is_valid():
            try:
                revform.save()
                return redirect('/home')
            except:
                pass
    else:
        revform = ReviewForm()
    return render(request, 'revadd.html', {'revform':revform})


'''
-------------------------------------------------------------
-----------Customize index page------------------------------
-------------------------------------------------------------
'''


def customize(request):
    if request.method == 'POST':
        customizeform = CustomizeForm(request.POST, request.FILES)
        if customizeform.is_valid():
            try:
                customizeform.save()
                return redirect('/showproduct')
            except:
                pass
    else:
        customizeform = CustomizeForm()
    return render(request, 'customize.html', {'customizeform':customizeform})



'''
-------------------------------------------------------------
-----------Front end pages for all customers/visitors--------
-------------------------------------------------------------
'''

def onlinestore(request):
    trendyproducts =  products = Product.objects.all().order_by('price') [:8];
    products = Product.objects.all()
    reviews = Review.objects.all().order_by('-id') [:3]
    banner = Customize.objects.all().order_by('-id') [:1]
    return render(request, 'index.html', {'trendyproducts':trendyproducts, 'products':products, 'customize':customize, 'reviews':reviews, 'banner':banner})


def home(request):
    trendyproducts = Product.objects.all().order_by('price') [:8];
    products = Product.objects.all()
    reviews = Review.objects.all().order_by('-id') [:3]
    banner = Customize.objects.all().order_by('-id') [:1]
    return render(request, 'index.html', {'trendyproducts':trendyproducts, 'products':products, 'customize':customize, 'reviews':reviews, 'banner':banner})


def allproducts(request):
    limit = 12
    trendyproducts =  products = Product.objects.all().order_by('-SKU');
    products = Product.objects.all()
    customize = Customize.objects.all()
    paginator = Paginator(products, limit)
    page =request.GET.get('page')
    products = paginator.get_page(page)
    return render(request, 'allproducts.html', {'trendyproducts':trendyproducts, 'products':products, 'customize':customize})


def productdetails(request, id):
    product = Product.objects.get(SKU=id)
    return render(request, 'productdetails.html', {'product':product})



'''
-------------------------------------------------------------
-----------Front end pages for logged in customers-----------
-------------------------------------------------------------
'''

def custhome(request):
    trendyproducts = Product.objects.all().order_by('price') [:8];
    products = Product.objects.all()
    cust =  Customer.objects.get(id=request.session['custid'])
    reviews = Review.objects.all().order_by('-id') [:3]
    banner = Customize.objects.all().order_by('-id') [:1]
    return render(request, 'custindex.html', {'trendyproducts':trendyproducts, 'products':products, 'customize':customize, 'cust':cust, 'reviews':reviews, 'banner':banner})



def custallproducts(request):
    limit = 12
    trendyproducts =  products = Product.objects.all().order_by('-SKU');
    products = Product.objects.all()
    cust =  Customer.objects.get(id=request.session['custid'])
    customize = Customize.objects.all()
    paginator = Paginator(products, limit)
    page =request.GET.get('page')
    products = paginator.get_page(page)
    return render(request, 'custallproducts.html', {'cust':cust, 'trendyproducts':trendyproducts, 'products':products, 'customize':customize})



def custproductdetails(request, id):
    product = Product.objects.get(SKU=id)
    cust =  Customer.objects.get(id=request.session['custid'])
    return render(request, 'custproductdetails.html', {'cust':cust,'product':product})


'''
-------------------------------------------------------------
-----------Search products backend---------------------------
-------------------------------------------------------------
'''

def search(request):
    products = Product.objects.filter(title__icontains=request.GET['search']).values()
    return JsonResponse(list(products), safe=False)


'''
-------------------------------------------------------------
-----------Search product frontend---------------------------
-------------------------------------------------------------
'''


def searchproduct(request):
    return render (request, 'search.html')


def getsearchedproduct(request):
    search = request.POST['search']
    products = Product.objects.filter(title__icontains= search)
    return render (request, 'allproducts.html', {'products':products})


'''
-------------------------------------------------------------
-------Search product frontend for logged in custommer-------
-------------------------------------------------------------
'''


def custsearchproduct(request):
    return render (request, 'custsearch.html')


def getcustsearchedproduct(request):
    search = request.POST['search']
    cust =  Customer.objects.get(id=request.session['custid'])
    products = Product.objects.filter(title__icontains= search)
    return render (request, 'custallproducts.html', {'cust':cust,'products':products})    


'''
-------------------------------------------------------------
---------------------------End-------------------------------
-------------------------------------------------------------
'''
