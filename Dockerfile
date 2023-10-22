FROM httpd:2.4 as build
COPY . /usr/local/apache2/htdocs/

FROM amazon/aws-cli
ENV AWS_ACCESS_KEY_ID=AKIARHYRKQ5NRI67SEFC
ENV AWS_SECRET_ACCESS_KEY=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
RUN mkdir /front
WORKDIR /front
COPY --from=build /usr/local/apache2/htdocs/ /front
RUN aws s3 cp /front s3://mariyam7892/front --recursive
