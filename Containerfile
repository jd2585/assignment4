# Start from Fedora
FROM fedora:latest

# Update system and install tuxpaint, vim, and httpd
RUN dnf -y update && \
    dnf -y install tuxpaint vim httpd && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Copy the local myinfo.html into the container
COPY myinfo.html /var/www/html/myinfo.html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Make sure httpd runs when the container starts
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
