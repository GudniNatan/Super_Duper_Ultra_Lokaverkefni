from porridge import Porridge
import os
from django.conf import settings

secret_key = settings.SECRET_KEY

porridge = Porridge('secretKey:%s' % (secret_key), time_cost=8, memory_cost=1024, parallelism=16)

def boil(password):
    return porridge.boil(password)

def verify(password, old_boiled_password):
    old_boiled_password = old_boiled_password.encode()
    return porridge.verify(password, old_boiled_password)

def updatePass(boiled_password):
    if porridge.needs_update(boiled_password):
        return porridge.boil(boiled_password)
    return boiled_password