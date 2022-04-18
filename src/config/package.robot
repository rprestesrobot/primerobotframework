*** Settings ***
Documentation    Este será o nosso gerenciador de dependências


Library    SeleniumLibrary
Library    FakerLibrary
Library    DebugLibrary


##################
#    Keywords    #
##################
Resource    ../auto/keywords/kws_web.robot
Resource    ../auto/keywords/kws_webtesting.robot
Resource    ../auto//keywords//kws_login.robot

##################
#    Config      #
##################
Resource    hooks.robot
Variables    hooks.yaml
Variables    ../auto/data/register.yaml
