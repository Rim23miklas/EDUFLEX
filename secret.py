import secrets
import string

def generate_secret_key(length=24):
    # Define the alphabet of characters to choose from
    alphabet = string.ascii_letters + string.digits + '!@#$%^&*-_=+'
    # Generate a secure random key
    return ''.join(secrets.choice(alphabet) for _ in range(length))

# Generate a random key of length 24 (adjust length as needed)
random_key = generate_secret_key(32)
print(random_key)



