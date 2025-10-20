#!/usr/bin/env bash

DOMAIN="elijahwood.co.uk"
TIMEOUT=3

STATUS=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout $TIMEOUT "https://$DOMAIN")

DNS_CHECK=$(dig +short $DOMAIN 2>/dev/null)
if [[ -z "$DNS_CHECK" ]]; then
    DNS=0
else
    DNS=1
fi

if [[ "$STATUS" -ge 200 && "$STATUS" -lt 400 ]]; then
    echo "{\"text\": \"✔️ - Up (DNS=$DNS_CHECK, HTTP=$STATUS)\", \"class\": \"up\"}"
else
    echo "{\"text\": \"❌ - Down (DNS=$DNS_CHECK, HTTP=$STATUS)\", \"class\": \"down\"}"
fi

