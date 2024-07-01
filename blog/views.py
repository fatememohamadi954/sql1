from django.shortcuts import render,redirect
from .forms import ProdectForm

# Create your views here.
def add_prodect(request):
    if request.method=='POST':
        form=ProdectForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('product_list')
        else:
            form=ProductForm()
        return render(request,'shop/add_product.html',{'form':form})