import base64

# Example: {{ var | b64encode }}
def b64encode(s):
    return base64.b64encode(s.encode('utf-8')).decode('utf-8')
