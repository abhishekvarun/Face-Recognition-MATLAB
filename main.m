
clear all

yn=input('Are you a new user ? (y/n) :','s')
if yn == 'n'
recognition()    
else
    createdatabase()
end
