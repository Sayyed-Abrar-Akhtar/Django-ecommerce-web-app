from django.shortcuts import render, redirect
from product.models.productmodels import Product, Type, Vendor, User
from product.forms.productforms import ProductForm, TypeForm, VendorForm, UserForm
from django.http import HttpResponse,JsonResponse
from product.authenticate import Authenticate
from django.db.models import Q 




def logout(request):
    del request.session['username']
    del request.session['password']
    return redirect('/login')


def login(request):
    if request.method == "POST":
        request.session['username'] = request.POST['username']
        request.session['password'] = request.POST['password']
        user = User.objects.get(Q(username = request.POST.get('username')) & Q(password = request.POST.get('password'))) 
        request.session['id']= user.id
        print(request.session['id'])
        return redirect('/showproduct')
    return render(request, 'login.html')


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
    return render(request, 'newproduct.html', {'form':form, 'typeform': typeform})

@Authenticate.valid_user
def addtype(request):
    types = Type.objects.all()
    if request.method == 'POST':
        form = TypeForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/showproduct')
            except:
                pass
    else:
        form = TypeForm()
    return render(request, 'newtype.html', {'form':form, 'types': types})


@Authenticate.valid_user
def addvendor(request):
    if request.method == 'POST':
        form = VendorForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/showproduct')
            except:
                pass
    else:
        form = VendorForm()
    return render(request, 'newvendor.html', {'form':form})


def adduser(request):
    if request.method == 'POST':
        form = UserForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('/register')
            except:
                pass
    else:
        form = UserForm()
    return render(request, 'register.html', {'form':form})





@Authenticate.valid_user
def showproduct(request):
    products = Product.objects.all().order_by('title')
    vendors = Vendor.objects.all()
    user = User.objects.get(id = request.session['id'])
    return render(request, 'dashboard.html', {'products':products, 'vendors': vendors, 'user':user})


@Authenticate.valid_user
def showTypes(request):
    types = Type.objects.all()
    return render(request, 'dashboard.html', {'types':types})


@Authenticate.valid_user
def showVendor(request):
    vendors = Vendor.objects.all()
    return render(request, 'newvendor.html', {'vendors':vendors})



@Authenticate.valid_user
def showuser(request):
    users = User.objects.all()
    return render(request, 'dashboarduser.html', {'users':users})





def editproduct(request, id):
    if (request.session['username'] != "" ):
        vendors = Vendor.objects.all()
        types = Type.objects.all()
        products = Product.objects.get(SKU=id)
        return render(request, 'productedit.html', {'products':products, 'types':types, 'vendors':vendors})
    else:
        return redirect('/login')



def edituser(request, id):
    user = User.objects.get(id = id)
    return render(request, 'userupdate.html', {'user':user})




def userupdate(request, id):
    user = User.objects.get(id=id)
    if request.method == "POST":
        form = UserForm(request.POST, request.FILES, instance = user)
        #if form.is_valid:
        form.save()
        return redirect('/showproduct')
    else:
        form = UserForm()       
    return render(request, 'userupdate.html', {'users':users})






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




@Authenticate.valid_user
def deleteproduct(request, id):
    product = Product.objects.get(SKU = id)
    print("hi deleting")
    print(request.session['admin'])
    if request.session['admin'] == True:
        print("entered if in delete")
        product.delete()
    else:
        return redirect('/showproduct')
    return redirect('/showproduct')
    



def search(request):
    products = Product.objects.filter(title__icontains=request.GET['search']).values()
    return JsonResponse(list(products), safe=False)


def home(request):
    trendyproducts =  products = Product.objects.all().order_by('price') [:8];
    products = Product.objects.all()
    return render(request, 'index.html', {'trendyproducts':trendyproducts, 'products':products})

def onlinestore(request):
    trendyproducts =  products = Product.objects.all().order_by('price') [:8];
    products = Product.objects.all()
    return render(request, 'index.html', {'trendyproducts':trendyproducts, 'products':products})


def allproducts(request):
    trendyproducts =  products = Product.objects.all().order_by('-SKU');
    products = Product.objects.all()
    return render(request, 'allproducts.html', {'trendyproducts':trendyproducts, 'products':products})

def signup(request):
    trendyproducts =  products = Product.objects.all().order_by('price') [:8];
    '''if request.method == 'POST':
        form = CustomerForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/customOnlinestore')
            except:
                pass
    else:
        form = CustomerForm()'''
    return render(request, 'signup.html', {'trendyproducts':trendyproducts})


def register(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/login')
            except:
                pass
    else:
        form = UserForm()
    return render(request, 'signup.html', {'form':form})