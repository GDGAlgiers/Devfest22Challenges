import torch
import torch.nn as nn

class MyModel(nn.Module):
    def __init__(self) -> None:
        super(MyModel, self).__init__()
        self.linear1 = nn.Linear(128, 128, bias=False)
        self.linear2 = nn.Linear(128, 16, bias=False)
        self.linear3 = nn.Linear(16, 1, bias=False)

    def forward(self, x):

        x = self.linear1(x)
        x = self.linear2(x)
        x = self.linear3(x)

        return x

torch.manual_seed(22)    
model = MyModel()