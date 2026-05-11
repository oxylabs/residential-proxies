# Residential Proxies
[![residential-proxies](https://raw.githubusercontent.com/oxylabs/residential-proxies/refs/heads/master/residential-proxies-banner%20new.png)](https://oxylabs.io/products/residential-proxy-pool)

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

Welcome to the official repository overview for Oxylabs' [Residential Proxies](https://oxylabs.io/products/residential-proxy-pool) This guide provides a technical overview of how our residential proxies work, their core features, and how to implement advanced filtering to optimize your web scraping infrastructure.

## What are Residential Proxies?

Residential proxies route your internet traffic through an intermediary server that uses an IP address provided by an Internet Service Provider (ISP) to a real, physical device (such as a desktop computer or a mobile phone).

Residential IPs belong to legitimate users. This makes them highly trusted by target servers, allowing developers to extract public data without triggering CAPTCHAs or IP blocks.


### How the Proxy Pool Works

When your scraper sends a request through our network, it connects to a central Oxylabs gateway. The gateway then automatically assigns an available IP address from our continuously updated global pool of real devices.
Developers can configure the gateway to:
- **Rotate IPs:** Assign a new IP address for every single concurrent request.
- **Maintain Sticky Sessions:** Keep the same IP address for a specified duration (up to 24 hours), which is essential for navigating multi-step forms or complex login flows.

### Core Features

To provide the best residential proxies for enterprise-level data extraction, our infrastructure is built around these technical pillars:

- **Vast proxy pool:** Access millions of ethically sourced, real-device IPs worldwide
- **Precise geo-targeting:** Filter requests down to the country, state, city, or specific ASN level
- **Flexible session control:** Choose between per-request IP rotation or sticky sessions (up to 24 hours)
- **Advanced fingerprint filtering:** Specify operating systems (Windows, macOS, Android, etc.)
- **IP version selection:** Choose between IPv4/IPv6 to match target requirements
- **Unlimited concurrent sessions:** Scale your scraping operations without artificial connection limits
- **Stable gateway and port model:** Connect via a single endpoint `pr.oxylabs.io` without managing individual IP lists
- **Multi-protocol support:** `HTTP`, `HTTPS`, and `SOCKS5`
- **Flexible authentication:** Credentials (username/password) or IP whitelisting
- **Centralized management:** Track usage, manage sub-users, and configure limits via the Oxylabs dashboard

### Advanced Filtering Features

To maximize success rates on strictly protected targets, Oxylabs allows developers to pass specific parameters to the proxy gateway.

#### 1. IP Version (IPv4 / IPv6)

Depending on your target server's supported protocols, you can filter the proxy pool to route requests exclusively through IPv4 or IPv6 addresses.
Read more in our [IP version documentation](https://developers.oxylabs.io/proxies/residential-proxies/advanced-features/ip-version).

#### 2. Platform (OS) Selection

You can specify the operating system of the proxy peer. Supported platforms include: Android, iOS, Windows, macOS, Linux.
Why this matters: Matching the proxy's OS with your scraper's TCP and HTTP/browser fingerprints is crucial for bypassing advanced anti-bot systems. Aligning the OS selection with your scraper's fingerprint significantly improves success rates.

Read more in the [Platform (OS) documentation](https://developers.oxylabs.io/proxies/residential-proxies/advanced-features/platform-os).

## How Residential Proxies Work

Residential Proxies use a backconnect gateway instead of a static IP list. Each request is routed through the Oxylabs gateway and matched to an available residential peer based on the parameters you provide.

### Basic Setup Flow

1. **Purchase a proxy plan.** Access the global residential IP pool directly from the dashboard.
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

If the request is successful, the response will display a random residential IP address from the global pool. Since port `7777` is used for rotation, a new IP address will be assigned for every subsequent request. To maintain the same IP for up to 24 hours (sticky session), ports can be changed to the `10000-100000` range (e.g., `10001`, `10002`, etc.).


### Proxy List and Port Mapping

Residential proxy connection details can be directly accessed in the Oxylabs dashboard. Since residential proxies utilize a backconnect gateway rather than a static list of IPs, the connection parameters consist of:

| Column | Description |
|--------|-------------|
| Entry point | The backconnect gateway used to access the proxy pool, for example `pr.oxylabs.io` |
| Port | The port that defines the session behavior |
| Country | The geographic location targeted dynamically by appending parameters to the username |
| ISP (ASN) | The specific provider or ASN targeted dynamically by appending parameters to the username |
| Assigned IP | A dynamic residential IP assigned from the global pool upon a successful connection |

Users can also manage sub-users, track traffic usage, and generate proxy endpoints programmatically via the RESTful API. For more details, refer to the official [Residential Proxies documentation](https://developers.oxylabs.io/proxies/residential-proxies).

### Available Protocols

Residential Proxies support the following protocols:

| Protocol | Request example |
|----------|-----------------|
| HTTP | `curl -x http://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |
| HTTPS | `curl -x https://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |
| HTTP/3 | `socks.pr.oxylabs.io:7777` [custom implementations](https://github.com/oxylabs/gohttp3viaSOCKS5UDP) may be required to run the requests|
| SOCKS5 (`TCP` and `UDP`) | `curl -x socks5h://pr.oxylabs.io:7777 -U customer-USERNAME:PASSWORD https://ip.oxylabs.io/location` |

**Note:** Make sure that the libraries or third-party tools you use are compatible with `HTTPS` and `SOCKS5`.

### Authentication

Residential Proxies support two primary authentication methods:

- **Username and password** pPass your credentials directly within your request headers or proxy URL string (e.g., `customer-username:password@pr.oxylabs.io:7777`).
- **IP whitelisting** Add your server's public IP address to your Oxylabs dashboard. Once whitelisted, any requests originating from that IP will be automatically authenticated without needing a username and password.

## Residential Proxies vs Other Proxy Types

Understanding the difference between proxy types is crucial for optimizing your scraping pipeline's cost and success rate. Here is how the best residential proxies compare to other solutions:

| Feature | Residential Proxies | Datacenter Proxies | ISP Proxies |
|---------|----------------------|--------------------|-------------|
| Source | Real user devices (mobile and desktop) | Cloud server data centers | ISP-assigned server IPs |
| IP rotation | Highly dynamic, with per-request or sticky sessions | Static or limited rotation | Static or limited rotation |
| Trust score | Very high | Low to medium | High |
| Speed | Variable, depending on peer connection | Extremely fast | Very fast |
| Best use case | Bypassing strict anti-bot systems and localized scraping | High-speed bulk scraping on unprotected sites | Long sessions and account management workflows |

## When to Use Residential Proxies

Residential Proxies are best suited for:

- **Public data collection:** Scrape highly protected targets, such as flight aggregators or real estate listings, without being blocked.
- **Ad verification:** Check localized ad placements, ensure compliance, and detect fraud by viewing pages exactly as a real user in that specific region would.
- **Market research and e-commerce:** Gather accurate, localized pricing, product availability, and customer reviews from global markets to inform competitive pricing models.

## Fair Usage Policy

To maintain network quality for all users, the service operates under a Fair Usage Policy:

- **Bandwidth-based billing:** Strictly measured by the amount of data transferred (GB).
- **Unlimited concurrent sessions:** No limits on your concurrent connections.
- **Ethical usage requirements:** All proxies must be used in accordance with Oxylabs Acceptable Use Policy. Illegal activities, credential stuffing, or DDoS attacks are strictly prohibited and will result in immediate termination.

## Learn More

For detailed configuration, advanced usage, and multi-language code examples, check these official pages:

- [Get started with Residential Proxies](https://oxylabs.io/products/residential-proxy-pool)
- [Residential Proxies documentation](https://developers.oxylabs.io/proxies/residential-proxies)
- [Third-party integration guide](https://developers.oxylabs.io/proxies/integration-guides/3rd-party-integrations)

## Contact Us

If you have questions or need support, reach out to us at support@oxylabs.io, or through live chat, accessible via [Oxylabs Dashboard](https://dashboard.oxylabs.io/en/), or join our [Discord community](https://discord.gg/Pds3gBmKMH). For enterprise-related inquiries, contact your dedicated account manager.
