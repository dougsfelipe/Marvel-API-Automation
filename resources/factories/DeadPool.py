
from faker import Faker
faker = Faker()

def factory_deadpool():

    return {
	"name": "Wade Wilson",
	"aliases": "Deadpool",
	"age": 40,
	"team": "Ordem Negra",
	"active": True
    }