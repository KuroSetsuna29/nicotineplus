FROM ubuntu:bionic

ENV LOGIN=$LOGIN
ENV PASSW=$PASSW
ENV DARKMODE=$DARKMODE

RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:nicotine-team/stable \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CEB6050A30E5769 \
    && apt update \
    && apt install -y software-properties-common nginx nicotine tzdata dos2unix

ENV TZ="America/Toronto"

COPY config /root/.config/default/config
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY favicon.svg /var/www

EXPOSE 8080
# EXPOSE 2234
# EXPOSE 2235
# EXPOSE 2236
# EXPOSE 2237
# EXPOSE 2238
# EXPOSE 2239

COPY init.sh /init.sh
RUN dos2unix /init.sh \
    && chmod +x /init.sh
ENTRYPOINT ["/init.sh"]

# Alternative for GTK4, which looks better because it uses DOM nodes for each GTK component instead of a Canvas element for each window.
# However, performance is actually worse because many search results equals many nodes, and all labels are rendered as images...
# More info: https://blogs.gnome.org/alexl/2019/03/29/broadway-adventures-in-gtk4/
#
# HOWTO: Replace the relevant sections above with the ones below + check init.sh as well.
# 
# FROM ubuntu:hirsute
#
# RUN add-apt-repository ppa:nicotine-team/unstable
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CEB6050A30E5769
# RUN apt update
# RUN apt install -y libgtk-4-1 python3-pip gir1.2-gtk-4.0 pkg-config libcairo2-dev libgirepository1.0-dev gcc
# RUN pip3 install PyGObject==3.40.1
# RUN apt install nicotine
