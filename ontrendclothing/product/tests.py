from django.test import TestCase
from product.forms.productforms import ProductForm, TypeForm, VendorForm, UserForm, CustomerForm, CustomizeForm, ReviewForm
from product.models.productmodels import Product, Type, Vendor, User, Customer, Customize, Review




class TypeTestCase(TestCase):

	def create_type(self, type='test'):
		return Type.objects.create(type='test')

	def test_type_creation(self):
		type = self.create_type()
		self.assertTrue(isinstance(type, Type))
		self.assertEqual(type.__str__(), type.type)



class VendorTestCase(TestCase):

	def create_vendor(self, vendor='test'):
		return Vendor.objects.create(vendor='test')

	def test_type_creation(self):
		vendor = self.create_vendor()
		self.assertTrue(isinstance(vendor, Vendor))
		self.assertEqual(vendor.__str__(), vendor.vendor)


class UserTestCase(TestCase):

	def create_user(self, username="test", first_name="test"):
		return User.objects.create(username="test", first_name="test")

	def test_user_creation(self):
		user = self.create_user()
		self.assertTrue(isinstance(user, User))
		self.assertEqual(user.__str__(), user.username)


class CustomerTestCase(TestCase):

	def create_customer(self, user="test", first_name="test"):
		return Customer.objects.create(user="test", first_name="test")

	def test_customer_creation(self):
		customer = self.create_customer()
		self.assertTrue(isinstance(customer, Customer))
		self.assertEqual(customer.__str__(), customer.user)


class ReviewTestCase(TestCase):

	def create_review(self, name="test", review="testcase"):
		return Review.objects.create(name="test", review="testcase")

	def test_review_creation(self):
		review = self.create_review()
		self.assertTrue(isinstance(review, Review))
		self.assertEqual(review.__str__(), review.review)