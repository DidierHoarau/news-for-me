import tensorflow

test = tensorflow.constant('Test!')

session = tensorflow.Session()

print("=================================")

print(session.run(test))