import sys
import tensorflow
import numpy
x_predict = sys.argv[1:]
x_predict = x_predict.values
x_predict = x_predict.astype('float64')

from sklearn.preprocessing import MinMaxScaler 
scale_features_mm = MinMaxScaler()
x_predict = scale_features_mm.fit_transform(x_predict) 

from tensorflow.keras.models import load_model
model = load_model('tasks_lstm.h5')
prediction = model.predict(x_predict)

print prediction