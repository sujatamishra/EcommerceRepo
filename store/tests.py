from django.test import TestCase
from .models import Product


# Create your tests here.
class ProductTestCase(TestCase):

    def setUp(self):
        Product.objects.create(name="spoon_222", price=10)
        Product.objects.create(name="doll_222", price=11)

    def test_product_test(self):

        product1 = Product.objects.get(name="spoon_222")
        product2 = Product.objects.get(name="doll_222")
        self.assertEqual(product1.name, 'spoon_222')
        self.assertEqual(product2.name, 'doll_222')


    def create_product(self,name,price):
        return Product.objects.create(name=name,price=price)

    def  test_product_qs(self):
        name="bbbbb"
        price=234
        obj1=self.create_product(name=name,price=price)
       # obj2=self.create_product(name=name)
        qs=Product.objects.filter(name=name)
        self.assertEqual(qs.count(), 1) 
