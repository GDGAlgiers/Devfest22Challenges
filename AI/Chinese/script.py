import pandas as pd
import numpy as np
answers = pd.read_csv('./answers (do not share it).csv')
submission = pd.read_csv('./submission.csv')


def getAccuracy(submission):
    same = submission["target"] == answers["target"]
    accuracy = np.array(same).sum()/len(same)
    return accuracy
