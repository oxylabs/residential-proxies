# Residential Proxies
[![residential-proxies](https://github.com/oxylabs/residential-proxies/blob/main/residential-proxies-banner.png)](https://oxylabs.io/products/residential-proxy-pool)

[![](https://dcbadge.limes.pink/api/server/Pds3gBmKMH?style=for-the-badge&theme=discord)](https://discord.gg/Pds3gBmKMH) [![YouTube](https://img.shields.io/badge/YouTube-Oxylabs-red?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@oxylabs)

# Residential Proxies

- [What are Residential Proxies?](#what-are-residential-proxies)
    + [How the Proxy Pool Works](#how-the-proxy-pool-works)
    + [Core Features](#core-features)
    + [Advanced Filtering Features](#advanced-filtering-features)
- [How Residential Proxies Work](#how-residential-proxies-work)
    + [Basic Setup Flow](#basic-setup-flow)
    + [Proxy List and Port Mapping](#proxy-list-and-port-mapping)
    + [Available Protocols](#available-protocols)
    + [Authentication](#authentication)
- [Residential Proxies vs Other Proxy Types](#residential-proxies-vs-other-proxy-types)
- [When to Use Residential Proxies](#when-to-use-residential-proxies)
- [Fair Usage Policy](#fair-usage-policy)
- [Learn More](#learn-more)
- [Contact Us](#contact-us)

This repository provides a technical overview of how Oxylabs [Residential Proxies](https://oxylabs.io/products/residential-proxy-pool) work, their core capabilities, and how to use advanced filtering for scraping and data collection workflows.

## What are Residential Proxies?

Residential proxies route your internet traffic through an intermediary server that uses an IP address provided by an Internet Service Provider (ISP) and assigned to a real physical device, such as a desktop computer or mobile phone.

Residential IPs belong to legitimate users. This makes them highly trusted by target servers, allowing developers to extract public data without triggering CAPTCHAs or IP blocks.

### How the Proxy Pool Works

When your scraper sends a request through the network, it connects to a central Oxylabs gateway. The gateway automatically assigns an available IP address from a continuously updated global pool of real devices.

Developers can configure the gateway to:

- **Rotate IPs** by assigning a new IP address for each concurrent request
- **Maintain sticky sessions** by keeping the same IP address for a specified duration, which is useful for multi-step flows or login-based tasks

### Core Features

To support enterprise-level data extraction, Residential Proxies are built around these technical capabilities:

- **Vast proxy pool** with millions of ethically sourced, real-device IPs worldwide
- **Precise geo-targeting** down to country, state, city, or ASN level
- **Flexible session control** with per-request rotation or sticky sessions
- **Advanced fingerprint filtering** for operating systems such as Windows, macOS, Android, and others
- **IP version selection** for IPv4 or IPv6 routing
- **Unlimited concurrent sessions** for large-scale scraping workloads
- **Stable gateway and port model** through a single endpoint: `pr.oxylabs.io`
- **Multi-protocol support** for HTTP, HTTPS, and SOCKS5
- **Flexible authentication** through username/password or IP whitelisting
- **Centralized management** through the Oxylabs dashboard

### Advanced Filtering Features

Residential Proxies support additional filters that help improve success rates on protected targets.

#### IP Version (IPv4 / IPv6)

Depending on the target server's supported protocols, the proxy pool can be filtered to route requests only through IPv4 or IPv6 addresses.

Read more in the [IP version documentation](https://developers.oxylabs.io/proxies/residential-proxies/advanced-features/ip-version).

#### Platform (OS) Selection

You can specify the operating system of the proxy peer. Supported platforms include Android, iOS, Windows, macOS, and Linux.

Matching the proxy OS with your scraper's TCP, HTTP, or browser fingerprint helps reduce detection risk on targets protected by advanced anti-bot systems.

Read more in the [Platform (OS) documentation](https://developers.oxylabs.io/proxies/residential-proxies/advanced-features/platform-os).

## How Residential Proxies Work

Residential Proxies use a backconnect gateway instead of a static IP list. Each request is routed through the Oxylabs gateway and matched to an available residential peer based on the parameters you provide.

### Basic Setup Flow

1. **Purchase a proxy plan.** Access the global residential IP pool through the dashboard.
2. **Create proxy credentials.** Generate a username and password in the [Oxylabs dashboard](https://dashboard.oxylabs.io/en/).
3. **Send a test request.** Route traffic through the gateway and the rotating port:

```bash
curl -x http://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location
```

The sample request above consists of:

- **Host:** `pr.oxylabs.io`
- **Port:** `7777` for rotating IPs on every request
- **Credentials:** `customer-USERNAME:PASSWORD` where the `customer-` prefix is mandatory
- **Request target:** `https://ip.oxylabs.io/location`

If the request is successful, the response will display a random residential IP address from the global pool. Port `7777` rotates IPs automatically, while ports in the `10000-100000` range can be used for sticky sessions.

### Proxy List and Port Mapping

Residential proxy access details are available in the Oxylabs dashboard. Because this product uses a backconnect gateway rather than a fixed IP list, the main connection parameters are:

| Column | Description |
|--------|-------------|
| Entry point | The backconnect gateway used to access the proxy pool, for example `pr.oxylabs.io` |
| Port | The port that defines the session behavior |
| Country | The geographic location targeted dynamically through username parameters |
| ISP (ASN) | The provider or ASN targeted dynamically through username parameters |
| Assigned IP | A dynamic residential IP assigned after a successful connection |

Users can also manage sub-users, track traffic usage, and generate endpoints programmatically through the API. For more details, refer to the [Residential Proxies documentation](https://developers.oxylabs.io/proxies/residential-proxies).

### Available Protocols

Residential Proxies support the following protocols:

| Protocol | Request example |
|----------|-----------------|
| HTTP | `curl -x http://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |
| HTTPS | `curl -x https://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |
| SOCKS5 (`TCP` and `UDP`) | `curl -x socks5h://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |

**Note:** Make sure that the libraries or third-party tools you use are compatible with `HTTPS` and `SOCKS5`.

### Authentication

Residential Proxies support two primary authentication methods:

- **Username and password** passed in the proxy URL or request configuration
- **IP whitelisting** by adding your server's public IP address in the dashboard

## Residential Proxies vs Other Proxy Types

| Feature | Residential Proxies | Datacenter Proxies | ISP Proxies |
|---------|----------------------|--------------------|-------------|
| Source | Real user devices (mobile and desktop) | Cloud server data centers | ISP-assigned server IPs |
| IP rotation | Highly dynamic, with per-request or sticky sessions | Static or limited rotation | Static or limited rotation |
| Trust score | Very high | Low to medium | High |
| Speed | Variable, depending on peer connection | Extremely fast | Very fast |
| Best use case | Bypassing strict anti-bot systems and localized scraping | High-speed bulk scraping on unprotected sites | Long sessions and account management workflows |

## When to Use Residential Proxies

Residential Proxies are best suited for:

- **Public data collection** on highly protected websites such as travel, classifieds, or real estate platforms
- **Ad verification** for checking localized placements, compliance, and fraud signals
- **Market research and e-commerce** for gathering localized pricing, availability, and review data

## Fair Usage Policy

To maintain network quality for all users, the service operates under a Fair Usage Policy:

- **Bandwidth-based billing** measured by transferred data volume in GB
- **Unlimited concurrent sessions** without artificial connection limits
- **Ethical usage requirements** aligned with the Oxylabs Acceptable Use Policy

## Learn More

For detailed configuration, advanced usage, and multi-language code examples, check these official pages:

- [Get started with Residential Proxies](https://oxylabs.io/products/residential-proxy-pool)
- [Residential Proxies documentation](https://developers.oxylabs.io/proxies/residential-proxies)
- [Third-party integration guide](https://developers.oxylabs.io/proxies/integration-guides/3rd-party-integrations)

## Contact Us

If you have questions or need support, reach out to us at hello@oxylabs.io, through [live chat](https://oxylabs.drift.click/oxybot), or join our [Discord community](https://discord.gg/Pds3gBmKMH). For enterprise-related inquiries, contact your dedicated account manager.
