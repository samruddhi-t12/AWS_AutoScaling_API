
A highly available, containerized REST API built to solve the "Thundering Herd" problem during university result announcements. This project demonstrates dynamic cloud infrastructure that horizontally scales to handle massive concurrent traffic spikes without downtime.

## Architecture & Flow

Instead of relying on a single, fragile static server, this architecture utilizes a distributed microservices approach:
1. **Application Load Balancer (ALB):** Acts as the single point of contact, distributing incoming student traffic only to healthy nodes.
2. **Auto Scaling Group (ASG):** Monitors infrastructure health and automatically provisions or terminates instances based on real-time traffic.
3. **Containerized Compute (EC2 & Docker):** The FastAPI application runs inside isolated Docker containers on AWS EC2 instances, eliminating environment drift.
4. **CloudWatch Telemetry:** Triggers scaling policies when average CPU utilization crosses the 15% threshold.

## Tech Stack

* **Backend:** Python 3.9, FastAPI, Uvicorn
* **Infrastructure & Cloud:** AWS EC2, Application Load Balancer, Auto Scaling Groups, CloudWatch
* **DevOps:** Docker, Bash Scripting (User Data)
* **Performance Engineering:** Apache JMeter
* **Data Analytics:** Pandas, Matplotlib

---

## Performance & Load Testing Results

To prove the fault tolerance of the system, a rigorous load test was executed simulating a massive traffic spike (500 concurrent users, 50,000+ requests). 

### 1. The Traffic Spike (JMeter Telemetry)
*The API successfully handled massive throughput while maintaining stability.*

<img width="1920" height="1020" alt="Screenshot 2026-04-23 085321" src="https://github.com/user-attachments/assets/d1ba75e5-f68a-47e0-9354-5f11b8222e75" />


### 2. The Auto-Scaling Trigger (AWS CloudWatch)
*CloudWatch detecting the CPU threshold breach during the JMeter attack.*

<img width="1920" height="1020" alt="Screenshot 2026-04-23 083656" src="https://github.com/user-attachments/assets/be3f67a3-a1bf-4fb6-a02e-7734cea11784" />


### 3. Horizontal Scaling in Action (AWS EC2)
*The Auto Scaling Group successfully reacted to the load by automatically provisioning 5 additional servers, scaling from 1 to 6 running instances.*

<img width="1920" height="1020" alt="Screenshot 2026-04-23 084820" src="https://github.com/user-attachments/assets/9088b84c-66d6-45bb-8494-dadd9e4a26ae" />


### 4. Big Data Analytics (Pandas & Matplotlib)
*Processing the raw server logs to visualize system latency, bottleneck distribution, and overall fault tolerance.*

<img width="1920" height="1020" alt="Screenshot 2026-04-23 064356" src="https://github.com/user-attachments/assets/6fc0d1d4-67ff-435c-9f1d-3aeb18580de3" />


---

## Key Features
* **Zero-Downtime Deployments:** Containers ensure the app runs flawlessly on any node.
* **Cost Optimization:** The ASG scales the instances down to `0` or `1` when traffic subsides, ensuring AWS compute resources are only paid for when needed.
* **Self-Healing Infrastructure:** If a container or instance crashes, the ALB instantly diverts traffic, and the ASG spins up a replacement node.
