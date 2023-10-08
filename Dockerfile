FROM httpd:2.4 as build
COPY . /usr/local/apache2/htdocs/

FROM amazon/aws-cli
RUN mkdir /front
WORKDIR /front
COPY --from=build /usr/local/apache2/htdocs/ /front
RUN aws s3 cp /front s3://mariyam7892/ --recursive
