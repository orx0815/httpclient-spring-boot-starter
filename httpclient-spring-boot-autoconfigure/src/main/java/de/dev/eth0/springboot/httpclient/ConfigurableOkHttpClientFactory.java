/*
 * Copyright (c) 2020. dev-eth0.de All rights reserved.
 */

package de.dev.eth0.springboot.httpclient;

import org.springframework.cloud.commons.httpclient.DefaultOkHttpClientFactory;

import okhttp3.OkHttpClient;

/**
 * Factory used to generate a {@link OkHttpClient.Builder} instance with the given configuration
 */
public class ConfigurableOkHttpClientFactory extends DefaultOkHttpClientFactory {

  private final HttpClientProperties httpClientProperties;

  public ConfigurableOkHttpClientFactory(OkHttpClient.Builder builder, HttpClientProperties httpClientProperties) {
    super(builder);
    this.httpClientProperties = httpClientProperties;
  }

  @Override
  public OkHttpClient.Builder createBuilder(boolean disableSslValidation) {
    OkHttpClient.Builder builder = super.createBuilder(disableSslValidation);

    return builder;
  }
}