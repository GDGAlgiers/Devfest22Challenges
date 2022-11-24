from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, GRU
maxlen = 26
model = Sequential()
model.add(GRU(128, input_shape=(maxlen, 1)))
model.add(Dense(1, activation='sigmoid'))
model.compile(loss='binary_crossentropy',
              optimizer='adam')
