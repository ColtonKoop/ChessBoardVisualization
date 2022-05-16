import deepLearningModel
import seaborn as sn
import matplotlib.pyplot as plt
import pandas as pd

if __name__ == "__main__":
    trainLoc = "./Data/train"
    testLoc = "./Data/test"
    runName = "realTrain37.5p_unitytrain6_25p_realTest_100p_60pTest"
    model = deepLearningModel.getModel()

    # Commented out, code to start from previous model as well change epcochs to run
    #oldWeights = "./RunData/unityTrain12_5p_3epochs/model_weights.h5"
    #model.load_weights(oldWeights)

    #deepLearningModel.epochs = 7

    deepLearningModel.trainModel(model, trainLoc, testLoc, runName)

