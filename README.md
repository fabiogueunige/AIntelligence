# AIntelligence

A comprehensive repository for Artificial Intelligence in Robotics, featuring implementations of automated planning algorithms and reinforcement learning techniques.

## 📋 Overview

This repository contains coursework and projects related to AI for robotics, covering two main areas:
- **Automated Planning**: PDDL (Planning Domain Definition Language) implementations for various robotic scenarios
- **Reinforcement Learning**: Q-Learning and dynamic programming implementations for decision-making problems

## 🗂️ Repository Structure

### 1. **Planning** 📐
Contains multiple PDDL domain and problem files for classical planning scenarios:

#### Key Projects:
- **`gripper/`**: Classic gripper domain where a robot with two grippers moves balls between rooms
- **`airport/`**: Airport logistics planning problems
- **`bartender/`**: Bartender serving and mixing drinks scenarios
- **`pizzaRomi/`**: Pizza cooking and preparation planning
- **`TomatoEASY/`**: Simple tomato handling scenarios
- **`Traveling/`**: City traveling and navigation problems
- **`ObjFixer/`**: Object repair and maintenance planning
- **`gripperHL/`**: High-level gripper planning variations
- **`RomiPddl/`**: Extended collection of PDDL problems including:
  - Bar management scenarios
  - Pizza party planning
  - Plant care planning
  - Robot repair tasks
  - Landscaping problems
  - Past exam problems (2022-2023)

### 2. **AI2Planning** 🤖
Advanced planning implementation featuring:
- `Guelfi_domain.pddl`: Complex coffee-making domain with detailed actions for:
  - Moka pot assembly and disassembly
  - Coffee grinding
  - Burner control
  - Water management
  - Cleaning procedures
- `Guelfi_problem.pddl`: Corresponding problem instance

### 3. **BlackJack** 🎲
Reinforcement learning implementations for the Blackjack card game:

#### Files:
- **`GuelfiQLearningBJ.ipynb`**: Custom implementation of Q-Learning for Blackjack
  - Custom environment creation with OpenAI Gym interface
  - Card deck simulation
  - Q-Learning agent implementation
  - Training and visualization
  - Average payout: tracked over 1000 rounds × 1000 samples

- **`GYMProj.ipynb`**: Gymnasium-based implementation
  - Uses official Gymnasium Blackjack environment
  - Epsilon-greedy strategy
  - Policy visualization (with/without usable ace)
  - 3D state-value plots

### 4. **RLearningExample** 📊
Educational notebooks demonstrating reinforcement learning concepts:

#### Files:
- **`DynamicProgramming_ENG.ipynb`**: 
  - Policy Iteration algorithm
  - Value Iteration algorithm
  - GridWorld 4×4 environment
  - Optimal policy computation

- **`ReinforcementLearning_ENG.ipynb`**:
  - SARSA (on-policy) implementation
  - Q-Learning (off-policy) implementation
  - Epsilon-greedy policy
  - GridWorld experimentation

## 🚀 Getting Started

### Prerequisites

**For Reinforcement Learning:**
```bash
pip install gymnasium numpy matplotlib seaborn tqdm
```

**For PDDL Planning:**
- A PDDL planner (e.g., [Fast Downward](https://www.fast-downward.org/), [OPTIC](https://github.com/KCL-Planning/optic), or online planners like [Planning.Domains](http://editor.planning.domains/))

### Running the Code

#### Reinforcement Learning Notebooks:
1. Open any `.ipynb` file in Jupyter Notebook or VS Code
2. Run cells sequentially to see training results and visualizations

#### PDDL Planning:
1. Choose a domain file (e.g., `gripper.pddl`) and its corresponding problem file (e.g., `gripper-four.pddl`)
2. Run with your PDDL planner:
   ```bash
   # Example with Fast Downward
   ./fast-downward.py domain.pddl problem.pddl --search "astar(lmcut())"
   ```

## 📚 Key Concepts Implemented

### Planning (PDDL)
- **STRIPS Planning**: Classical planning with preconditions and effects
- **Action Schemas**: Parameterized actions for flexible planning
- **Domain Modeling**: Complex real-world scenarios (coffee making, logistics, etc.)
- **Goal Achievement**: State-space search to reach target configurations

### Reinforcement Learning
- **Q-Learning**: Off-policy temporal difference learning
- **SARSA**: On-policy temporal difference learning
- **Dynamic Programming**: Policy iteration and value iteration
- **Epsilon-Greedy Exploration**: Balance between exploration and exploitation
- **Custom Environments**: Building OpenAI Gym-compatible environments

## 📈 Example Results

### Blackjack Q-Learning
- Successfully learns optimal Blackjack strategy
- Achieves positive average payout after training
- Visualizes policy for different hand values and dealer upcards

### GridWorld Navigation
- Finds optimal paths in 4×4 grid environments
- Demonstrates convergence of value iteration and policy iteration
- Shows effectiveness of temporal difference learning

## 🎓 Academic Context

This repository contains coursework for an AI in Robotics course, demonstrating:
- Theoretical understanding of planning and learning algorithms
- Practical implementation skills
- Problem modeling and domain design
- Experimental analysis and visualization

## 👤 Author

**Fabio Guelfi**
- Student ID: s5004782
- Repository: [AIntelligence](https://github.com/fabiogueunige/AIntelligence)

## 📝 License

This project is for educational purposes. Feel free to use the code for learning and reference.

## 🔗 Useful Resources

- [OpenAI Gymnasium Documentation](https://gymnasium.farama.org/)
- [PDDL Reference Guide](https://planning.wiki/)
- [Reinforcement Learning: An Introduction (Sutton & Barto)](http://incompleteideas.net/book/the-book.html)

---

*Last updated: October 2025*

