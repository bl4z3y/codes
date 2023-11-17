import brcrypting as brc

KEY =   '2AB2CD2EF'
#       2B2CD2EFA


list_key = brc.key_to_list(KEY)
brc.crypt_it(list_key)