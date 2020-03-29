# omniauth-vonage
OmniAuth strategy for Vonage

### Use
```
provider :vonage, ENV['VONAGE_KEY'], ENV['VONAGE_SECRET'], { scope: 'openid', prompt: 'login' }
```