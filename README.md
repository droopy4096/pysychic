## PySychic

A very rudimentary tool for sharing URLs "seemlessly" from-device-to-device.
I simply needed something to allow me to communicate URL over to HTPC without
running Kodi or any other sophisticated system and simply invoke default 
browser

### Requirements 

* `python`
* `pip`
* GNU `make`
* (optional) `firewalld` - not really a requirement, but it's `firewall-cmd` is 
  required to adjust firewall rules. But only if you want `make` do it for you,
  if you're comfortable managing your own firewall - you'll need port `5000` be 
  open for incoming `tcp` traffic. 

### Usecase

#### Devices 

##### Android phone

running [HTTP Shortcuts](https://http-shortcuts.rmy.ch/)

##### Linux-based Home Theatre PC

running Xorg/Wayland with `xdg-open` present.

Assuming IP: 172.0.0.10

#### Flow 

On Android device, within [HTTP Shortcuts](https://http-shortcuts.rmy.ch/):
1. create global variable `url`:
  * [ ] Multiline
  * [ ] Remember value
  * [x] URL encode 
  * [ ] JSON encode 
  * [x] Allow receiving value from Share Dialogue
  * `Data to Receive from Sharing`: `Text only`
  * [ ] Exclude stored value from exports
2. Create shortcut:
  * `Basic Request Settings`:
    * `Method`: `GET`
    * `URL`: `http://172.0.0.10:5000/q?{url}`

On Linux HTPC:

1. clone this repo 
2. install requirements
  ```bash 
  make requirements
  ```
3. open up firewall
  ```bash 
  make firewall-open
  ```
4. run the app:
  ```bash 
  make run
  ```

On Android device navigate to a desired site/page, "share" URL to `HTTP Shortcuts`. 
If you have several shortcuts select the one you've just created. Default browser on 
Linux HTPC should open shared URL now. 

Once comfortable with above simple setup you can explore more advanced features of 
[HTTP Shortcuts](https://http-shortcuts.rmy.ch/), and have same shortcut work for 
multiple PCs (using static multiple choice selector variable). You can also add `pysychic` 
to the desktop startup sequence and have it enabled by default on start. 

### TODO 

* [ ] Authentication
  * default setup with no authentication may leave HTPC vulnerable to DoS attacks from within 
    local network, or even malicious site invocation so beware.
* [ ] Switch to `golang` implementation for portability and compactness
