# GreenBuilt

GreenBuilt 是一個以繁體中文呈現的綠色建築與混凝土自癒技術互動網站，整合原版的 3D 粒子自癒實驗室，以及 MICP 生化自癒模擬器。

## 功能

### 自癒互動實驗室

提供原版「自癒結晶即時 3D 粒子力學系統」，包含粒子模型、核心參數控制、晶體顏色與密度調整、3D 動畫、手勢控制、全螢幕與播放控制等互動功能。入口位於 [`/lab`](./lab)。

### MICP 生化自癒模擬器

以 MICP（微生物誘導碳酸鈣沉澱）為主題，提供生化自癒流程、裂縫修復視覺化與參數操作介面。入口位於 [`/micp-sim`](./micp-sim)。

## 本機執行

需求：Node.js 與 npm。

```bash
npm install
npm run dev
```

開發伺服器啟動後，依終端機顯示的網址開啟網站即可。

## 建置與預覽

```bash
npm run build
npm run preview
```

## 技術架構

本專案使用 React、TypeScript、Vite、Tailwind CSS、Framer Motion 與 React Router 建置。首頁與全域導覽列提供兩個實驗室的獨立入口；兩個獨立頁面也都保留返回首頁的導覽控制。

## 專案目標

GreenBuilt 致力於以易於理解且可互動的方式展示低碳建築材料、混凝土裂縫修復與生物礦化技術，協助使用者了解自癒材料的科學原理與應用潛力。
