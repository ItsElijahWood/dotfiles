#!/bin/bash

DOMAIN="digiboard.cloud"
TIMEOUT=3

# Check HTTP status code
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout $TIMEOUT "https://$DOMAIN")

# Check DNS resolution
DNS_CHECK=$(dig +short $DOMAIN)
if [[ -z "$DNS_CHECK" ]]; then
    DNS=1
else
    DNS=0
fi

# Output JSON based on HTTP status
if [[ "$STATUS" =~ ^[23] ]]; then
    echo "{\"text\": \"✔️ - Up (DNS=$DNS_CHECK, HTTP=$STATUS)\", \"class\": \"up\"}"
else
    echo "{\"text\": \"❌ - Down(DNS=$DNS_CHECK, HTTP=$STATUS)\", \"class\": \"down\"}"
fi

