from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, GRU
chars = sorted(
    list(set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_{}“”,.: ()")))
maxlen = 18
model = Sequential()
model.add(GRU(128, input_shape=(maxlen, len(chars))))
model.add(Dense(len(chars), activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer="rmsprop")
