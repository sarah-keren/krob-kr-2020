__author__ = 'sarah'

import model


class GR(model.Model):

    """Goal Recognition superclass
       supporting COMPLETE
    """
    def __init__(self,):
        self.policy_graphs= None


    def get_wcd(self, hyps_indices = None):
        raise NotImplementedError


    def recognize(self, observation):
        raise NotImplementedError

    

